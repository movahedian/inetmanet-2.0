//
// Copyright (C) 2012 Calin Cerchez
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include "Gateway.h"
#include "LTEUtils.h"

Gateway::Gateway(char *plmnId, char *tac, unsigned pathId) {
	// TODO Auto-generated constructor stub
	this->tac = tac;
	this->plmnId = plmnId;
	this->pathId = pathId;
}

Gateway::~Gateway() {
	// TODO Auto-generated destructor stub
}

std::string Gateway::info() const {

    std::stringstream out;
    if (plmnId != NULL)
    	out << "plmnId:" << LTEUtils().toASCIIString(plmnId, PLMNID_CODED_SIZE) << " ";
    if (tac != NULL)
    	out << "tac:" << LTEUtils().toASCIIString(tac, TAC_CODED_SIZE) << " ";
    out << "pathId:" << pathId;
    return out.str();
}
