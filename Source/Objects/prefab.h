//-----------------------------------------------------------------------------
//           Name: prefab.h
//      Developer: Wolfire Games LLC
//    Description: 
//        License: Read below
//-----------------------------------------------------------------------------
//
//   Copyright 2022 Wolfire Games LLC
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
//-----------------------------------------------------------------------------
#pragma once

#include <Objects/object.h>
#include <Objects/group.h>

#include <Math/mat4.h>
#include <Math/quaternions.h>

#include <Game/EntityDescription.h>

class Prefab : public Group {
public:
    Prefab();
    bool prefab_locked;
    Path prefab_path;

    vec3 original_scale_;

    bool Initialize();
    virtual EntityType GetType() const { return _prefab; }

    virtual void GetDisplayName(char* buf, int buf_size);

    virtual bool SetFromDesc( const EntityDescription &desc );
    virtual void GetDesc(EntityDescription &desc) const;
    virtual void InfrequentUpdate();

    virtual void InitShape();

    virtual bool LockedChildren();

    virtual ObjectSanityState GetSanity();
};
