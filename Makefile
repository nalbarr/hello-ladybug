help:
	@echo make install-uv
	@echo make get-data
	@echo make run-notebook
	@echo ""
	@echo make run
	@echo make run-explorer

install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

ipython-install: 
	python -m ipykernel install --user --name hello-ladybug --display-name hello-ladybug	

get-data:
	curl -L -o ./data/city.csv https://raw.githubusercontent.com/LadybugDB/ladybug/refs/heads/master/dataset/demo-db/csv/city.csv
	curl -L -o ./data/user.csv https://raw.githubusercontent.com/LadybugDB/ladybug/refs/heads/master/dataset/demo-db/csv/user.csv
	curl -L -o ./data/follows.csv https://raw.githubusercontent.com/LadybugDB/ladybug/refs/heads/master/dataset/demo-db/csv/follows.csv	
	curl -L -o ./data/lives-in.csv https://raw.githubusercontent.com/LadybugDB/ladybug/refs/heads/master/dataset/demo-db/csv/lives-in.csv	

run: clean
	uv run main.py

clean:
	rm -f ./example.lbug

run-explorer:
	docker run -p 8000:8000 \
        -v .:/database \
        -e LBUG_FILE=example.lbug \
        --rm lbugdb/explorer:latest