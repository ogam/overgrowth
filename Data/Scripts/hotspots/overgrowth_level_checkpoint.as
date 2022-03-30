//-----------------------------------------------------------------------------
//           Name: overgrowth_level_checkpoint.as
//      Developer: Wolfire Games LLC
//    Script Type: Hotspot
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

void SetParameters() {
	params.AddInt("level_hotspot_id", -1);
    params.AddInt("checkpoint_id", -1);
}

void HandleEvent(string event, MovementObject @mo){
    if(event == "enter"){
        OnEnter(mo);
    }
    if(event == "exit"){
        OnExit(mo);
    }
}

int entered = -1;
float entered_time = 0.0f;

void OnEnter(MovementObject @mo) {
    if(mo.controlled && params.HasParam("level_hotspot_id") && params.HasParam("checkpoint_id")){
        if(params.HasParam("fall_death")){
            int level_hotspot_id = params.GetInt("level_hotspot_id");
            if(ObjectExists(level_hotspot_id)){
                Object@ obj = ReadObjectFromID(level_hotspot_id);
                int checkpoint_id = params.GetInt("checkpoint_id");
                obj.ReceiveScriptMessage("player_entered_checkpoint_fall_death "+checkpoint_id);
            }
        } else {
            entered = mo.GetID();
            entered_time = the_time;
        }
    }
}

void OnExit(MovementObject @mo) {
    if(mo.controlled){
        if(mo.GetID() == entered){
            entered = -1;
        }
    }
}

void Update() {
    if(entered != -1){
        if(!params.HasParam("time") || entered_time < the_time - params.GetFloat("time")){
            int level_hotspot_id = params.GetInt("level_hotspot_id");
            if(ObjectExists(level_hotspot_id)){
                Object@ obj = ReadObjectFromID(level_hotspot_id);
                int checkpoint_id = params.GetInt("checkpoint_id");
                obj.ReceiveScriptMessage("player_entered_checkpoint "+checkpoint_id);
            }
            entered = -1;
        }
    }
}