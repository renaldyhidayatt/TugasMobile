import uvicorn
from fastapi import FastAPI

from config.database import create_table
from router.employee import router as employee_router

app = FastAPI() # untuk membuat class Fastapi


@app.on_event("startup") ## function ketika sedang jalan diawal
async def startup():
    create_table() ## Membuat Table
    print("StartUp") ## Printout ketika baru dijalankan


@app.get("/") ## Routing method get
def read_root():
    return {"Hello": "World"} ## Menghasilkan json


app.include_router(employee_router) # untuk mendaftarkan routring yang kita buat


if __name__ == "__main__": ## untuk mendeteksi file utama

    uvicorn.run("main:app", reload=True) ## untuk dieksekusi file main dan variabel app
