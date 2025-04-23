package com.house.jachui.estate.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Estate {

	private int estateNo;
	private String estateType;
	private String estateAddress;
	private int estateFloor;
	private int estateWidth;
	private Date estateMoveinDate;
	private String moveinNowYN;
	private String estateRentType;
	private int estateDeposit;
	private int estateMonthlyRent;
	private String userId;
	private String userPhone;
	private List<EstateOption>estateOptionList;
	private List<EstateFile>estateFileList;
	
	
	private String transformEstateDeposit;
    private String transformMonthlyRent;

    public void setTransformPrices() {
        this.transformEstateDeposit = transformToEokMan(this.estateDeposit);
        this.transformMonthlyRent = transformToEokMan(this.estateMonthlyRent);
    }

    private String transformToEokMan(int amount) {
        if (amount >= 10000) {
            int eok = amount / 10000;
            int man = amount % 10000;
            return man == 0 ? eok + "억" : eok + "억 " + man + "만";
        } else {
            return amount + "만";
        }
    }
}
