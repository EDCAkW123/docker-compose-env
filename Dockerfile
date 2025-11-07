FROM python:3.10-slim

ARG ARGUMENT_VAR=${example_var}
ARG ANOTHER_ARG=${another_var}
ARG TEST_ARG=${test_var}

RUN echo "Build ARG: ARGUMENT_VAR = $ARGUMENT_VAR"
RUN echo "Build ARG: ANOTHER_ARG = $ANOTHER_ARG"
RUN echo "Test ARG: TEST_ARG = $TEST_ARG"

WORKDIR /src

COPY . .

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000
CMD ["python", "/src/main.py"]

