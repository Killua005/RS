# Step 1: Use an official Python runtime as a parent image
FROM python:3.9-slim

# Step 2: Set the working directory in the container
WORKDIR /C:\Users\hccha\Projectt

# Step 3: Copy the current directory contents into the container at /usr/src/app
COPY . .

# Step 4: Install any needed packages specified in requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose the Jupyter port
EXPOSE 8888

# Step 6: Run the Jupyter Notebook server
CMD ["python" "./Model_Prediction.ipynb]
CMD ["python" "./cleansing_and_analysis.ipynb]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser"]

