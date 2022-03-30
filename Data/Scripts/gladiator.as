//-----------------------------------------------------------------------------
//           Name: gladiator.as
//      Developer: Wolfire Games LLC
//    Script Type:
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

int gold_;
int fame_;
int crowd_approval_;
int gov_approval_;

void NewCampaign(){
    gold_ = 0;
    fame_ = 0;
    crowd_approval_ = 0;
    gov_approval_ = 0;
    
    scenario = PickScenario();
    Equip();
    ExecuteScenario(scenario);
}

