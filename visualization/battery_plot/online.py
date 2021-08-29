"""
Usage:
    bokeh server --show online.py

"""
import pandas as pd

from bokeh.io import curdoc
from bokeh.layouts import row
from bokeh.models import ColumnDataSource
from bokeh.palettes import Blues4
from bokeh.plotting import figure


def gather_data():
    df = pd.read_csv(
        'battery_log.csv',
        header=None,
        parse_dates=True,
        names=['date', 'value'],
    )
    df['date'] = pd.to_datetime(df['date']).dt.tz_localize(None)
    df.set_index('date', inplace=True)
    df = df.resample('30s').mean()
    return df


source = ColumnDataSource(gather_data())

plot = figure(x_axis_type="datetime", sizing_mode='stretch_both', y_range=(0, 101))
plot.line(x='date', y='value', source=source, width=3, color='darkviolet')
plot.xaxis.ticker.desired_num_ticks = 20

curdoc().add_root(row(plot))
curdoc().title = "Battery"


def update():
    source.data = gather_data()


curdoc().add_periodic_callback(update, 5000)
