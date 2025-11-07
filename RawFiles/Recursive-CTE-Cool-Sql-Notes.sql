SELECT * FROM Groups;

--Descendants Loop
With loopCTE As
(
    Select ID as groupID
    From [Screen4Success.Admin]..Groups
    Where ID = 3

    Union All

    Select ID as groupID
    From [Screen4Success.Admin]..Groups g
        join loopCTE l on g.ParentGroupId = l.groupID
    Where IsDeleted = 0
)

Select g.*
Into #tempUp
From loopCTE l
    join [Screen4Success.Admin]..Groups g on g.id = l.groupID
option (maxrecursion 100);



-- Ancestor loop
With loopCTE As
(
    Select Id as groupId, ParentGroupId
    From [Screen4Success.Admin]..Groups
    Where Id = 2022

    Union All

    Select Id as groupId, g.ParentGroupId
    From [Screen4Success.Admin]..Groups g
        join loopCTE l on l.ParentGroupId = g.Id
    Where IsDeleted = 0
)

Select g.*
--Into #tempUp
From loopCTE l
    join [Screen4Success.Admin]..Groups g on g.id = l.groupId
option (maxrecursion 100);