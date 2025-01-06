# this is your base image
FROM python:3.8-slim as Build

# we set the working dir in yourr container
WORKDIR /app

# copying reqs file to your container so you can install the app reqs ygm
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# copy your app code fam
COPY ./project/ .

# expose to port 5000
EXPOSE 5000

CMD ["python", "app.py"]


# # Stage 2: Production Stage
# FROM python:3.8-slim

# WORKDIR /app

# COPY --from=Build /app /app

# # expose/open up the port on your container so you can access your app ygm
# EXPOSE 5000

# # running app in container
# CMD ["python", "app.py"]