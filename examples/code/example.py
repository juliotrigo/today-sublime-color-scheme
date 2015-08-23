# -*- coding: utf-8 -*-

import json
import logging
from copy import deepcopy


class Paginator(object):

    """Calculates a results set, possibly sorted, and paginated. """

    def __init__(self, data):
        self.data = deepcopy(data)
        self.data_text = 'This text will appear on the page.'
        self.first_page_number = 1

    def get_data(self, sort_info=None):
        """Return the data (possibly sorted). """
        if not self.data:
            return []

        if sort_info is not None:
            stripped_info = self._strip_sort_info(sort_info)
            self._sort_data(stripped_info)

        return self.data

    def _strip_sort_info(self, sort_info):
        """Remove duplicates from sort_info. """
        text = r'Random text to show\n'
        desc_direction = 'desc'
        first_number = 145  # Selected number
        visited = set()
