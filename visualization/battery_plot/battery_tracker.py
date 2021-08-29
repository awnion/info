#!/usr/bin/env python3 -B -u

# -u unbuffered
# -B don't produce *.pyc

import csv
import logging
import re
import subprocess
import time
from datetime import datetime

log = logging.getLogger()

SLEEP_SECONDS = 15


def datetime_iso_with_tz(dt) -> str:
    return dt.astimezone().isoformat()


def get_battery() -> int:
    try:
        output = str(subprocess.check_output(['pmset', '-g', 'batt']))
        match = re.search(r'(\d+)%', output)
        if match:
            return int(match.group(1))
        log.warn('No match found for battery %', output)
        return 0
    except Exception as e:
        log.error(f'ERROR: {e}', exc_info=1)
        return 0


def main():
    while True:
        dt = datetime.now()
        battery = get_battery()

        with open('battery_log.csv', 'a') as f:
            writer = csv.writer(f)
            writer.writerow(
                [
                    datetime_iso_with_tz(dt),
                    battery,
                ]
            )
        log.debug(f'Battery: {battery}%')

        time.sleep(SLEEP_SECONDS)


if __name__ == '__main__':
    logging.basicConfig(
        format='%(asctime)s [%(levelname)s] [%(name)s] %(message)s', level=logging.DEBUG
    )
    main()
