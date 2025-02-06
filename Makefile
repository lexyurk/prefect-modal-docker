export PYTHONPATH = .venv

setup:
	uv sync --all-extras --all-groups
	uv pip install --no-deps -e .



prefect-deploy: setup
	uv run prefect deploy --prefect-file prefect.yaml --all
	