from fastapi import APIRouter

from dto.employee import EmployeeDto
from sqlmodel import Session
from config.database import engine
from models.employee import Employee

router = APIRouter(prefix="/employee", tags=["Employee"])


@router.post("/")
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
