from pydantic import BaseModel


class EmployeeDto(BaseModel):
    firstName: str
    lastName: str
