-- make a select statement which returns one calculated field with name
-- ‘person_information’ in one string like described in the next sample:
-- Anna (age:16,gender:'female',address:'Moscow')
-- Add the ordering clause by calculated column in ascending mode
SELECT concat(
        name,
        ' (age:',
        age,
        ',gender:''',
        gender,
        ''',address:''',
        address,
        ''')'
    ) AS person_information
FROM person
ORDER BY person_information;