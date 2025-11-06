import os
from fastapi import FastAPI
from fastapi.responses import JSONResponse
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    example_var = os.getenv("example_var", "not set")
    another_var = os.getenv("another_var", "not set")
    return JSONResponse(content={
        "example_var": example_var,
        "another_var": another_var
    })

if __name__ == "__main__":
    print("Runtime ENV: example_var =", os.getenv("example_var"))
    print("Runtime ENV: another_var =", os.getenv("another_var"))
    uvicorn.run(app, host="0.0.0.0", port=8000)

