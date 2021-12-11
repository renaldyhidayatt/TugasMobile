from fastapi import APIRouter, HTTPException,status

from dto.employee import EmployeeDto # data transfer object sesuai yang kita buat
from sqlmodel import Session 
from config.database import engine 
from models.employee import Employee # class model 

router = APIRouter(prefix="/employee", tags=["Employee"]) # routing /employee


@router.post("/create") # method post
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
    db = Session(engine); # membuat session berdasarkan engine
    db_id = db.query(Employee).filter(Employee.id == id).first() ## untuk mengambil data pertama

    if not db_id:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="No Employe id") # untuk menghandle data

    db.delete(db_id); # untuk delete berdasarkan id
    db.commit();

    return "Delete aja"; # menghasilkan return delete aja
