from flask import Flask, request, jsonify, render_template
from flask.logging import create_logger
import logging
import json

import pandas as pd
from sklearn.externals import joblib
from sklearn.preprocessing import StandardScaler

app = Flask(__name__,
            template_folder='frontend')
LOG = create_logger(app)
LOG.setLevel(logging.INFO)


def scale(payload):
    """Scales Payload"""

    LOG.info(f"\nScaling Payload: \n{payload}")
    scaler = StandardScaler().fit(payload.astype(float))
    scaled_adhoc_predict = scaler.transform(payload.astype(float))
    return scaled_adhoc_predict


def log_inputs(input_name: str) -> str:
    form_input = request.form.get(input_name)
    form_input = float(form_input)
    LOG.info(
        f"\n| Variable: {input_name} | Value: {form_input} | Type: {type(form_input)} |")
    return form_input


@app.route("/")
def home():
    return render_template('index.html')


@app.route("/predict", methods=['POST'])
def predict():
    """Performs an sklearn prediction

        input looks like:
        {
        "CHAS":{
        "0":0
        },
        "RM":{
        "0":6.575
        },
        "TAX":{
        "0":296.0
        },
        "PTRATIO":{
        "0":15.3
        },
        "B":{
        "0":396.9
        },
        "LSTAT":{
        "0":4.98
        }

        result looks like:
        { "prediction" : [ <val> ] }

        """
    # Log inputs
    chas = int(log_inputs("chas"))

    rm = log_inputs("rm")

    tax = log_inputs("tax")

    ptratio = log_inputs("ptratio")

    b = log_inputs("b")

    lsat = log_inputs("lsat")

    # Create JSON
    x = {"CHAS": {"0": chas}, "RM": {"0": rm}, "TAX": {"0": tax},
         "PTRATIO": {"0": ptratio}, "B": {"0": b}, "LSTAT": {"0": lsat}}
    json_str = json.dumps(x)
    json_payload = json.loads(json_str)
    LOG.info(f"\nInput type (json_payload): {type(json_payload)}")

    # Inputs into string
    LOG.info(f"\nJSON payload: \n{json_payload}")
    inference_payload = pd.DataFrame(json_payload)
    LOG.info(f"\ninference_payload DataFrame: \n{inference_payload}")
    prediction_inference = list(clf.predict(inference_payload))
    LOG.info(f'\nprediction_inference: {prediction_inference}')
    # scale the input
    scaled_payload = scale(inference_payload)
    LOG.info(f"\nscaled_payload: \n{scaled_payload}")
    # get an output prediction from the pretrained model, clf
    prediction_scaled = list(clf.predict(scaled_payload))
    LOG.info(f'\nprediction_scaled: {prediction_scaled}')
    return render_template('index.html',
                           x=json_payload,
                           x_scaled=scaled_payload,
                           y=prediction_inference,
                           y_scaled=prediction_scaled)


if __name__ == "__main__":
    # load pretrained model as clf
    clf = joblib.load("./model_data/boston_housing_prediction.joblib")
    app.run(host='127.0.0.1', port=80, debug=True)  # specify port=80
