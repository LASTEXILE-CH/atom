local RefList2 = BaseClass("RefList2")

local function StaticNext(node)
    node = node._next
    return node
end

local function RefList2Ctor(self)
    self._next = nil
    self._cnt = 0
    self._root = RefListNode1.New()
    self._root._list = self
    self:_Init()
end


local function _Init(self)
    RefList2._Link(self._root, self._root)
    self._next = self._root
    self._cnt = 0
end

local function IsEmpty(self)
    return self._root._next == self._root
end

local function Size(self)
    return self._cnt
end

local function GetHead(self)
    return self._root._next
end

local function GetTail(self)
    return self._root._pre
end

local function GetCurrentNode(self)
    return self._next
end

local function Next(self)
    self._next = RefList2.StaticNext(self._next)
end

local function BeginIterator(self)
    self._next = self._root
    self._next = RefList2.StaticNext(self._next)
end

local function EndIterator(self)
    self._next = self._root
end

local function IsEndNode(self, node)
    return self._next == node
end

local function IsEnd(self)
    return self._next == self._root
end

local function PushBack(self, node)
    node:Detach()
    self._cnt = self._cnt + 1
    node._list = self
    RefList2._PushBefore(self._root, node)
end

local function PushFront(self, node)
    node:Detach()
    self._cnt = self._cnt + 1
    node._list = self
    RefList2._PushAfter(self._root, node)
end


local function Push(self, node)
    if self:IsEnd() then
        self:PushBack(node)
    else
        self:PushFront(node)
    end
end

local function PushBackList(self, list)
    if list == nil then
        return
    end
    self:PushBeforeList(self._root, list)
end


local function PushFrontList(self, list)
    if list == nil then
        return
    end
    self:PushAfterList(self._root, list)
end

local function PushAfter(self, before, node)
    node:Detach()
    self._cnt = self._cnt + 1
    node._list = self
    RefList2._PushAfter(before, node)
end

local function PushBefore(self, after, node)
    node:Detach()
    self._cnt = self._cnt + 1
    node._list = self
    RefList2._PushBefore(after, node)
end

local function PushAfterList(self, before, list)
    if list:Size() == 0 then
        return
    end
    if before:IsAttachList(list) then
        return
    end
    if before:IsAttach() == false then
        return
    end
    local receiveList = before._list
    local iter = list._root._next
    while iter ~= list._root do
        iter._list = receiveList
        iter = iter._next
    end
    local first = list._root._next
    local back = list._root._pre
    local next = before._next
    RefList2._Link(before, first)
	RefList2._Link(back, next)
	receiveList._cnt = receiveList._cnt + list.Size()
	list._Init()
end

local function PushBeforeList(self, after, list)
    if list:Size() == 0 then
        return
    end
    if after:IsAttachList(list) then
        return
    end
    if after:IsAttach() == false then
        return
    end
    local receiveList = after._list
    local iter = list._root._next
    while iter ~= list._root do
        iter._list = receiveList
        iter = iter._next
    end
    local first = list._root._next
    local back = list._root._pre
    local pre = after._pre
    RefList2._Link(pre, first)
	RefList2._Link(back, after)
	receiveList._cnt = receiveList._cnt + list.Size()
	list._Init()
end

local function Clear(self)
    local next = self._root._next;
    while next ~= self._root do
        local nextCopy = next._next;
        next._pre = nil
        next._next = nil
        next._list = nil
        next = nextCopy
    end
    self:_Init()
end

local function _Detach(self, node)
    if node == self._next then --! 如果是正在迭代的点, 则自动将Next移到下个点
        self._next = Next(_next)
    end
    RefList2._Link(node._pre, node._next)
    node._pre = nil
    node._next = nil
    _cnt = _cnt - 1
end

local function _PushAfter(before, node)
    local next = before._next
    RefList2._Link(before, node)
    RefList2._Link(node, next)
end

local function _PushBefore(after, node)
    local pre = after._pre
    RefList2._Link(pre, node)
    RefList2._Link(node, after)
end

local function _Link(pre, next)
    pre._next = next
    next._pre = pre
end

--static function
RefList2.StaticNext = StaticNext
RefList2._PushAfter = _PushAfter
RefList2._PushBefore = _PushBefore

--member function
RefList2.__init = RefList2Ctor
RefList2._Init = _Init
RefList2.Next = Next
RefList2.IsEmpty = IsEmpty
RefList2.Size = Size
RefList2.GetHead = GetHead
RefList2.GetTail = GetTail
RefList2.GetCurrentNode = GetCurrentNode
RefList2.Next = Next
RefList2.BeginIterator = BeginIterator
RefList2.EndIterator = EndIterator
RefList2.IsEndNode = IsEndNode
RefList2.IsEnd = IsEnd
RefList2.PushBack = PushBack
RefList2.PushFront = PushFront
RefList2.Push = Push
RefList2.PushBackList = PushBackList
RefList2.PushFrontList = PushFrontList
RefList2.PushAfter = PushAfter
RefList2.PushBefore = PushBefore
RefList2.PushAfterList = PushAfterList
RefList2.PushBeforeList = PushBeforeList
RefList2.Clear = Clear
RefList2._Detach = _Detach
RefList2._Link = _Link

return RefList2