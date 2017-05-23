import unittest
import json

class SpidersTests(unittest.TestCase):
    def test_compare(self):
        actual_result = []
        expected_result = []
        with open("expected_result.json", "r") as file:
            for line in file:
                expected_result.append(json.loads(line))
        with open("scraped_data_utf8.json", "r") as file:
            for line in file:
                actual_result.append(json.loads(line))

        self.assertEqual(expected_result, actual_result)

if __name__ == '__main__':
    unittest.main()
