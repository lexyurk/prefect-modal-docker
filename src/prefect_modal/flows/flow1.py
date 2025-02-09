from prefect import flow, task
import pydantic
from pydantic import BaseModel


class MyModel(BaseModel):
    name: str
    goodbye: bool = False


@task()
def do_print(param: str) -> None:
    print("Doing the task")
    print(param)


@flow(log_prints=True)
def run_my_flow(param: str) -> None:
    print("flow 2")
    do_print(param)


@flow(log_prints=True, name="test_flow")
def test_flow(args: MyModel):
    print(f"Hello {args.name} from Prefect! 🤗")
    run_my_flow(args.name)
    print(f"pydantic version: {pydantic.__version__}")
    if args.goodbye:
        print(f"Goodbye {args.name}!")
