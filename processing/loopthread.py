import logging
import time
from threading import Thread, Event

class LoopThread(Thread):
    def __init__(self, stop_event, interrupt_event):
        self.stop_event = stop_event
        self.interrupt_event = interrupt_event
        Thread.__init__(self)

    def run(self):
        while not self.stop_event.is_set():
            self.loop_process()
            if self.interrupt_event.is_set():
                self.interrupted_process()
                self.interrupt_event.clear()

    def loop_process(self):
        logging.info("Processing!")
        time.sleep(3)

    def interrupted_process(self):
        logging.info("Interrupted!")