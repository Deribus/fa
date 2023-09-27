--******************************************************************************************************
--** Copyright (c) 2022  Willem 'Jip' Wijnia
--**
--** Permission is hereby granted, free of charge, to any person obtaining a copy
--** of this software and associated documentation files (the "Software"), to deal
--** in the Software without restriction, including without limitation the rights
--** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--** copies of the Software, and to permit persons to whom the Software is
--** furnished to do so, subject to the following conditions:
--**
--** The above copyright notice and this permission notice shall be included in all
--** copies or substantial portions of the Software.
--**
--** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--** SOFTWARE.
--******************************************************************************************************


local EmitterProjectile = import("/lua/defaultprojectiles/emitter.lua").EmitterProjectile

-- upvalue scope for performance
local CreateBeamEmitterOnEntity = CreateBeamEmitterOnEntity

---@class MultiBeamProjectile : EmitterProjectile
MultiBeamProjectile = ClassProjectile(EmitterProjectile) {

    Beams = {'/effects/emitters/default_beam_01_emit.bp',},
    FxTrails = { },

    ---@param self MultiBeamProjectile
    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)

        -- local scope for performance
        local army = self.Army

        for k, v in self.Beams do
            CreateBeamEmitterOnEntity(self, -1, army, v)
        end
    end,
}
