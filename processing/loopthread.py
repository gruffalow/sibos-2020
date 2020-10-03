import logging
import time
from threading import Thread
from processing.setup_tables import setup_tables
from processing.find_cycles import process_remaining


class LoopThread(Thread):
    def __init__(self, stop_event, interrupt_event):
        self.stop_event = stop_event
        self.interrupt_event = interrupt_event
        Thread.__init__(self)

    def run(self):
        setup_tables()
        while not self.stop_event.is_set():
            self.loop_process()
            if self.interrupt_event.is_set():
                self.interrupted_process()
                self.interrupt_event.clear()

    def loop_process(self):
        logging.info("Processing")
        if process_remaining():
            time.sleep(10)

    def interrupted_process(self):
        logging.info("Interrupted!")
