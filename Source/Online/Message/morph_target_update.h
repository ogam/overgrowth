//-----------------------------------------------------------------------------
//           Name: morph_target_update.h
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

#include "online_message_base.h"
#include <Online/online_datastructures.h>

#include <array>

using std::array;

namespace OnlineMessages {
    class MorphTargetUpdate : public OnlineMessageBase {
    public:
        CommonObjectID object_id;
        float disp_weight;
        float mod_weight;
        array<char,128> name;

    public:
        MorphTargetUpdate();
        MorphTargetUpdate(ObjectID object_id, const MorphTargetStateStorage& morph_state);

        static binn* Serialize(void* object);
        static void Deserialize(void* object, binn* l);
        static void Execute(const OnlineMessageRef& ref, void* object, PeerID peer);
        static void* Construct(void *mem);
        static void Destroy(void* object);
    };
}
