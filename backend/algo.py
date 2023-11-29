def get_recommendation(temp, items):
    """
    Given a temperature and a list of items (with the same category), return a list of recommended items
    requirements: items should be a list of dictionary that includes items in the same category, and for each dictionary, 
    it should include the following fields: id, position, cold_resistance
    """
    inner_items = [item for item in items if item['position'] == 'inner'] + [None]
    middle_items = [item for item in items if item['position'] == 'middle']
    outer_items = [item for item in items if item['position'] == 'outer'] + [None]

    max_cold_resistance = sum(item['cold_resistance'] for item in items)
    dp = [[(float('inf'), []) for _ in range(max_cold_resistance + 1)] for _ in range(len(middle_items) + 1)]
    dp[0][0] = (0, []) 

    for i in range(1, len(middle_items) + 1):
        for j in range(max_cold_resistance + 1):
            dp[i][j] = min(dp[i][j], dp[i - 1][j])
            if j >= middle_items[i - 1]['cold_resistance']:
                new_count = dp[i - 1][j - middle_items[i - 1]['cold_resistance']][0] + 1
                new_items = dp[i - 1][j - middle_items[i - 1]['cold_resistance']][1] + [middle_items[i - 1]['id']]
                dp[i][j] = min(dp[i][j], (new_count, new_items))

    best_diff = float('inf')
    best_combo = []
    for inner in inner_items:
        for outer in outer_items:
            inner_cr = inner['cold_resistance'] if inner else 0
            outer_cr = outer['cold_resistance'] if outer else 0
            total_cold_resistance = inner_cr + outer_cr
            for middle_cr in range(max_cold_resistance + 1):
                total_resistance = total_cold_resistance + middle_cr
                count, items = dp[len(middle_items)][middle_cr]
                if count < float('inf'):
                    diff = abs(total_resistance - temp)
                    if diff < best_diff or (diff == best_diff and count < len(best_combo)):
                        best_diff = diff
                        best_combo = items + ([inner['id']] if inner else []) + ([outer['id']] if outer else [])

    return best_combo

# test
test = [
    {'id': 1, 'position': 'inner', 'cold_resistance': 1}, 
    {'id': 2, 'position': 'middle', 'cold_resistance': 2}, 
    {'id': 3, 'position': 'middle', 'cold_resistance': 3}, 
    {'id': 4, 'position': 'middle', 'cold_resistance': 4},
    {'id': 5, 'position': 'middle', 'cold_resistance': 5}
]
print(get_recommendation(6, test))
