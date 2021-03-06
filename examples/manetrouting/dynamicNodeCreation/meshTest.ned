//
// Copyright (C) 2005 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//

package inet.examples.manetrouting.dynamicNodeCreation;


import inet.nodes.inet.WirelessHost;
import inet.linklayer.ieee80211mesh.nodes.HostMesh;
import inet.linklayer.ieee80211mesh.nodes.HostSta;
import inet.linklayer.ieee80211mesh.nodes.BasicMobileManetMesh;
import inet.world.radio.ChannelControl;
import inet.linklayer.ieee80211mesh.nodes.gateWayMesh;
import inet.linklayer.ieee80211mesh.nodes.ApMeshNode;
import inet.nodes.ethernet.EtherSwitch;
import inet.linklayer.ieee80211mesh.nodes.ApMeshRelay;
import ned.DatarateChannel;
import inet.mobility.models.LaptopModelManager;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;

network meshTest
{
    parameters:
        int numSta = default(0);
        int numMeshHost = default(0);
        double nodeSeparation @unit(m) = default(120m);
    submodules:
        staHost[numSta]: HostSta {
            @display("p=208,59");
        }
        meshHost[numMeshHost]: HostMesh {
            @display("p=309,117");
        }
        fixhostA[5]: BasicMobileManetMesh {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 315m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.initialX = nodeSeparation/2.0;
                mobility.separation = nodeSeparation*2;
                @display("i=block/wrxtx;r=,,#707070");
        }
        fixhostB[4]: ApMeshRelay {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 315m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.initialX = (nodeSeparation/2.0)+nodeSeparation;
                mobility.separation = nodeSeparation*2;
                wlanMesh.hasLocator = true;
                @display("i=device/accesspoint;r=,,#707070");

        }
        fixhost2[5]: ApMeshRelay {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 195m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.initialX = nodeSeparation/2.0;
                mobility.separation = nodeSeparation*2;
                wlanMesh.hasLocator = true;
                @display("i=device/accesspoint;r=,,#707070");
        }
        fixhost3[5]: ApMeshRelay {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 435m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.separation = nodeSeparation*2;
                mobility.initialX = nodeSeparation/2.0;
                wlanMesh.hasLocator = true;
                @display("i=device/accesspoint;r=,,#707070");
        }

        fixhost6A[4]: BasicMobileManetMesh {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 75m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.separation = nodeSeparation*2;
                mobility.initialX = nodeSeparation/2.0+nodeSeparation;
                @display("i=block/wrxtx;r=,,#707070");
        }
        fixhost6[5]: ApMeshRelay {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 75m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.separation = nodeSeparation*2;
                mobility.initialX = nodeSeparation/2.0;
                wlanMesh.hasLocator = true;
                @display("i=device/accesspoint");
        }
        fixhost7[5]: ApMeshRelay {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 555m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.separation = nodeSeparation*2;
                mobility.initialX = nodeSeparation/2.0;
                wlanMesh.hasLocator = true;
                @display("i=device/accesspoint;r=,,#707070");
        }
        fixhost7A[4]: BasicMobileManetMesh {
            parameters:
                mobilityType = "LinearNodeDistributionMobility";
                mobility.initialY = 555m;// (floor(index/sqrt(numFixHosts))*nodeSeparation)+(nodeSeparation);
                mobility.separation = nodeSeparation*2;
                mobility.initialX = nodeSeparation/2.0+nodeSeparation;
                @display("i=block/wrxtx;r=,,#707070");
        }
        channelControl: ChannelControl {
            parameters:
                @display("p=60,23;i=misc/sun");
        }
        laptopModelManager: LaptopModelManager {

            @display("p=31,23;is=s");
        }
        channelControl: ChannelControl {
            @display("p=80,70;i=misc/sun");
        }
}


