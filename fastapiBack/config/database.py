from sqlmodel import create_engine # Untuk membuat engine
from sqlmodel.main import SQLModel # Untuk membuat buat table


SQLALCHAMY_DATABASE_URL = "sqlite:///./student.db" # url untuk menaruh letak database nya
engine = create_engine(SQLALCHAMY_DATABASE_URL, echo=True) ## untuk membuat engine 


def create_table():
    SQLModel.metadata.create_all(engine)

