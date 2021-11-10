import uvicorn
from fastapi import FastAPI

from config.database import create_table
from router.employee import router as employee_router

app = FastAPI()


@app.on_event("startup")
async def startup():
    create_table()
    print("StartUp")


@app.get("/")
def read_root():
    return {"Hello": "World"}


app.include_router(employee_router)


if __name__ == "__main__":

    uvicorn.run("main:app", reload=True)
