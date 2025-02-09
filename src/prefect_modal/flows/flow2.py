from prefect import flow, task
import pydantic


@task()
def do_print(param: str) -> None:
    print("Doing the task")
    print(param)


@flow(log_prints=True)
def run_my_flow(param: str) -> None:
    print("flow 2")
    do_print(param)


@flow(log_prints=True, name="test_flow_no_pydantic")
def test_flow_no_pydantic(name: str = "", goodbye: bool = False):
    print(f"pydantic version: {pydantic.__version__}")
    print(f"Hello {name} from Prefect! 🤗")
    run_my_flow(name)
    if goodbye:
        print(f"Goodbye {name}!")
