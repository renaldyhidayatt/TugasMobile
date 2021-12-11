from pydantic import BaseModel # untuk membuat model lalu buat dto(data transfer object)

class EmployeeDto(BaseModel):
    firstName: str ## request / response
    lastName: str ## request / response
