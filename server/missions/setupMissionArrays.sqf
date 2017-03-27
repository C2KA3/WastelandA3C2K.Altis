// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

MainMissions =
[
	// Mission filename, weight
	["mission_ArmedDiversquad", 0.4],
	["mission_Coastal_Convoy", 0.6],
	["mission_Convoy", 0.9],
	["mission_HostileHeliFormation", 0.5],
	["mission_APC", 0.3],
	["mission_LightArmVeh", 0.8],
	["mission_ArmedHeli", 0.5],
	["mission_CivHeli", 0.9],
	["mission_Smugglers", 0.7]
];

SideMissions =
[
	["mission_HostileHelicopter", 0.7],
	["mission_HostileVTOL", 1],
	["mission_MiniConvoy", 1],
	["mission_SunkenSupplies", 0.7],
	["mission_AirWreck", 1],
	["mission_Outpost", 1],
	["mission_Truck", 0.5],
	["mission_GeoCache", 0.7],
	["mission_HostageRescue", 1],
	["mission_Occupation", 0.8],
	["mission_Sniper", 0.6]
];

MoneyMissions =
[
    ["mission_MoneyShipment", 0.8],
	["mission_SunkenTreasure", 0.2],
	["mission_drugsRunners", 0.5],
	["mission_Roadblock", 0.5],
	["mission_TownInvasion", 0.3]
];

missionType_water =
[
	"mission_ArmedDiversquad",
	"mission_Coastal_Convoy",
	"mission_SunkenSupplies",
	"mission_SunkenTreasure"
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
//ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["Roadblock_", _x] call fn_startsWith}) apply {[_x, false]};
SniperMissionMarkers = (allMapMarkers select {["Sniper_", _x] call fn_startsWith}) apply {[_x, false]};
OccupationMissionMarkers = (allMapMarkers select {["Occupation_", _x] call fn_startsWith}) apply {[_x, false]};

/*if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
	["mission_AirWreck", 3],
	["mission_Occupation", 2],
	["mission_Sniper", 1]
	];
};*/

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;