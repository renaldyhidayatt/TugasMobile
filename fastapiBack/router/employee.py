from fastapi import APIRouter, HTTPException,status

from dto.employee import EmployeeDto
from sqlmodel import Session
from config.database import engine
from models.employee import Employee

router = APIRouter(prefix="/employee", tags=["Employee"])


@router.post("/create")
def createEmployee(request: EmployeeDto):
    db = Session(engine)

    db_employee = Employee(
        firstName=request.firstName,
        lastName=request.lastName,
    )

    db.add(db_employee)
    db.commit()
    return db_employee


@router.get("/")
def getEmployee():
    db = Session(engine)

    return db.query(Employee).all()


@router.put('/update/{id}')
def updateEmployee(id: int, request:EmployeeDto):
    db = Session(engine)
    db_id = db.query(Employee).filter(Employee.id == id).first()

    if not db_id:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="No Employe id")

    db_id.firstName = request.firstName
    db_id.lastName = request.lastName

    db.commit()

    return "Update Employee "


@router.delete('/delete/{id}')
def deleteEmployee(id: int):
    db = Session(engine);
    db_id = db.query(Employee).filter(Employee.id == id).first()

    if not db_id:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="No Employe id")

    db.delete(db_id);
    db.commit();

    return "Delete aja";
