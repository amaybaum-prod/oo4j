SELECT
	t.OWNER,
	t.TYPE_NAME,
	t.TYPECODE,
	ta.ATTR_NAME,
	ta.ATTR_TYPE_NAME,
	ct.ELEM_TYPE_NAME
FROM
	ALL_TYPES t,
	ALL_TYPE_ATTRS ta,
	ALL_COLL_TYPES ct
WHERE
	t.OWNER IN (:owners)
	AND t.OWNER = ta.OWNER(+)
	AND t.TYPE_NAME = ta.TYPE_NAME(+)
	AND t.OWNER = ct.OWNER(+)
	AND t.TYPE_NAME = ct.TYPE_NAME(+)
ORDER BY
    t.TYPECODE DESC,
	t.OWNER,
	t.TYPE_NAME,
	ta.ATTR_NO
