#!/usr/bin/env python

# Standard library
from typing import Optional
from glob import glob
import os

# 3rd party
import pandas as pd
import numpy as np

def get_data():
    # Find file
    paths = glob('expected/path/with/data/latest*.csv')
    if len(paths) == 0:
        return None
    elif len(paths) > 1:
        print('WARNING :: Multiple files found')
    path = sorted(paths, key=lambda f : os.stat(f).st_size)[-1]

    # Read file
    try:
        raw_data = pd.read_csv(path, parse_dates = True)
    except FileNotFoundError:
        return None

    raw_data.to_csv('raw_data.csv', index=False)

    # Process file
    data = raw_data.dropna(axis='columns', how='all')
    data['Col6'] = data['Col6'].fillna(0)

    data['ColA'] = data['ColB'] + 1/data['ColC']

    if np.any(np.isinf(data)):
        print('WARNING :: Infinite values')

    return data


################################################################################
# Nicely separated
from pathlib import Path
def find_data_path() -> Optional[Path]:
    paths = glob('expected/path/with/data/latest*.csv')
    if len(paths) == 0:
        print('WARNING :: Unable to find data file')
        return None
    elif len(paths) > 1:
        print('WARNING :: Multiple files found')
    path = sorted(paths, key=lambda f : os.stat(f).st_size)[-1]
    return Path(path)

DataCols = ['Col1', 'Col2', 'Col6', 'ColB', 'ColC']
def read_data(path: Path) -> Optional[pd.DataFrame]:
    try:
        raw_data = pd.read_csv(path, parse_dates = True)
    except FileNotFoundError:
        return None

    return raw_data[DataCols]

def process_data(raw_data: pd.DataFrame) -> pd.DataFrame:
    data = raw_data.dropna(axis='columns', how='all')
    data['Col6'] = data['Col6'].fillna(0)

    data['ColA'] = data['ColB'] + 1/data['ColC']

    return data

def get_data_better() -> pd.DataFrame:
    # Indeterministic code
    path = find_data_path()
    if path is None:
        return pd.DataFrame(columns=DataCols)

    raw_data = read_data(path)
    if raw_data is None:
        return pd.DataFrame(columns=DataCols)

    # Deterministic Code
    data = process_data(raw_data)

    if np.any(np.isinf(data)):
        print('WARNING :: Infinite values')

    return data

print(get_data())
print(get_data_better())
