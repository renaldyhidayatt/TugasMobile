from typing import Optional
from sqlmodel import SQLModel, Field


class Employee(SQLModel, table=True): ## membuat model
    id: Optional[int] = Field(primary_key=True, index=True) # membuat field tipe data int
    firstName: str ## tipe data str
    lastName: str ## tipe data str
