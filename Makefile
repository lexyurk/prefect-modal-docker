export PYTHONPATH = .venv

.PHONY: uv
uv:
	curl -LsSf https://astral.sh/uv/0.5.29/install.sh | sh
	uv venv

setup:
	@if [ ! -d ".venv" ] || ! command -v uv > /dev/null; then \
		echo "UV not installed or .venv does not exist, running uv"; \
		make uv; \
	fi
	@if [ ! -f "uv.lock" ]; then \
		echo "Can't find lockfile. Locking"; \
		uv lock; \
	fi
	uv sync --all-extras --all-groups
	uv pip install --no-deps -e .


prefect-deploy: setup
	uv run prefect deploy --prefect-file prefect.yaml --all
	