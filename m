Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C1D240737
	for <lists+linux-clk@lfdr.de>; Mon, 10 Aug 2020 16:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgHJOHY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 10 Aug 2020 10:07:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23566 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726996AbgHJOHY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Aug 2020 10:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597068442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9cNBeZMSVeP3DVGga0IkO789cQ/tXxxwecdgwFI3/0c=;
        b=PT8BHvAlY3N+VUpvFOPkGghVSA0rzJ7MLmUJDPCJLjjGzfATwyRxQ2ZXORdy1MeVPkRKup
        vjBDsWwluljadhpyZsJoduWu57gUsYjJULDnLf4tFBFnV43rSEX9swj3LQQ6oflX0i7yMs
        1vj7T8QYLSyWKyfDEdCVEQltyXos9S0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-Mb6sV11FNAGuzE8UIswpaA-1; Mon, 10 Aug 2020 10:07:18 -0400
X-MC-Unique: Mb6sV11FNAGuzE8UIswpaA-1
Received: by mail-qt1-f199.google.com with SMTP id e14so7530009qtm.5
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2020 07:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9cNBeZMSVeP3DVGga0IkO789cQ/tXxxwecdgwFI3/0c=;
        b=QsLbbtmGr5BLGU79y6PJd4yQWQRiGUo+UJWqF8YdCegUw6q1+W/VSKA/8xgJsCc2PD
         sUxcLMrzR//ia206Eo8rw2MjegnT0qy6cWfZyrIZAE0zFPqkNV+vNKNmRhP40sUc2XCl
         whiqgvpxyH+47Rk94NRHpI/YdGOkZXpsaUlaJZSFE+62QdwDaWgaQQRCRZoH/9WNdC9o
         a1ULseb4qJnWwwDQEbyeA+lCdP8RfxjZnaUJljQeoA9cgIlXtA9oiadS4P6AVfrPXfkr
         CcuTSyB3c81e6kMobVa5YV5Joj/ZvqFz2ZmGiv1RIAk0zCPNZBfe/c9UMSYIZy65YHZH
         ShrQ==
X-Gm-Message-State: AOAM532326XHP2+HKhNxQyqadYKKeb2HNYdYKGWuVZJUPX1zRBaZdOY1
        92c6ElH5K2zqrJw9LHBffbLEoZNoeFstUwGRFsWQ9IN6q5w3fQbt2mlDozXqJTQ4UPjFLrTJ+yK
        HPfTVWmFN1YVvhVoHHoGh
X-Received: by 2002:a37:a655:: with SMTP id p82mr25881933qke.92.1597068437841;
        Mon, 10 Aug 2020 07:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAhtpzC6B/AHUomREfdW5p+0revbNMjcYgvVSCxlQ/BOs8KbalMx56oktoq4uHLJOpSG1XQQ==
X-Received: by 2002:a37:a655:: with SMTP id p82mr25881912qke.92.1597068437536;
        Mon, 10 Aug 2020 07:07:17 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x57sm15834702qtc.61.2020.08.10.07.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 07:07:16 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] include: fpga: adi-axi-common.h: add definitions
 for supported FPGAs
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-clk@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mdf@kernel.org,
        ardeleanalex@gmail.com,
        Mircea Caprioru <mircea.caprioru@analog.com>
References: <20200810134252.68614-1-alexandru.ardelean@analog.com>
 <20200810134252.68614-6-alexandru.ardelean@analog.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <0f9aa0ed-11a2-cf49-6c5d-ff36ba8ff9eb@redhat.com>
Date:   Mon, 10 Aug 2020 07:07:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200810134252.68614-6-alexandru.ardelean@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 8/10/20 6:42 AM, Alexandru Ardelean wrote:
> From: Mircea Caprioru <mircea.caprioru@analog.com>
>
> All (newer) FPGA IP cores supported by Analog Devices, store information in
> the synthesized designs. This information describes various parameters,
> including the family of boards on which this is deployed, speed-grade, and
> so on.
>
> Currently, some of these definitions are deployed mostly on Xilinx boards,
> but they have been considered also for FPGA boards from other vendors.
>
> The register definitions are described at this link:
>   https://wiki.analog.com/resources/fpga/docs/hdl/regmap
> (the 'Base (common to all cores)' section).
>
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Thanks for changes.

Reviewed-by: Tom Rix <trix@redhat.com>

> ---
>  include/linux/fpga/adi-axi-common.h | 103 ++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/include/linux/fpga/adi-axi-common.h b/include/linux/fpga/adi-axi-common.h
> index 141ac3f251e6..5c7d212a5d4a 100644
> --- a/include/linux/fpga/adi-axi-common.h
> +++ b/include/linux/fpga/adi-axi-common.h
> @@ -13,6 +13,9 @@
>  
>  #define ADI_AXI_REG_VERSION			0x0000
>  
> +#define ADI_AXI_REG_FPGA_INFO			0x001C
> +#define ADI_AXI_REG_FPGA_VOLTAGE		0x0140
> +
>  #define ADI_AXI_PCORE_VER(major, minor, patch)	\
>  	(((major) << 16) | ((minor) << 8) | (patch))
>  
> @@ -20,4 +23,104 @@
>  #define ADI_AXI_PCORE_VER_MINOR(version)	(((version) >> 8) & 0xff)
>  #define ADI_AXI_PCORE_VER_PATCH(version)	((version) & 0xff)
>  
> +#define ADI_AXI_INFO_FPGA_VOLTAGE(val)		((val) & 0xffff)
> +
> +#define ADI_AXI_INFO_FPGA_TECH(info)		(((info) >> 24) & 0xff)
> +#define ADI_AXI_INFO_FPGA_FAMILY(info)		(((info) >> 16) & 0xff)
> +#define ADI_AXI_INFO_FPGA_SPEED_GRADE(info)	(((info) >> 8) & 0xff)
> +#define ADI_AXI_INFO_FPGA_DEV_PACKAGE(info)	((info) & 0xff)
> +
> +/**
> + * FPGA Technology definitions
> + */
> +#define ADI_AXI_FPGA_TECH_XILINX_UNKNOWN 		0
> +#define ADI_AXI_FPGA_TECH_XILINS_SERIES7		1
> +#define ADI_AXI_FPGA_TECH_XILINX_ULTRASCALE		2
> +#define ADI_AXI_FPGA_TECH_XILINX_ULTRASCALE_PLUS	3
> +
> +#define ADI_AXI_FPGA_TECH_INTEL_UNKNOWN			100
> +#define ADI_AXI_FPGA_TECH_INTEL_CYCLONE_5		101
> +#define ADI_AXI_FPGA_TECH_INTEL_CYCLONE_10		102
> +#define ADI_AXI_FPGA_TECH_INTEL_ARRIA_10		103
> +#define ADI_AXI_FPGA_TECH_INTEL_STRATIX_10		104
> +
> +/**
> + * FPGA Family definitions
> + */
> +#define ADI_AXI_FPGA_FAMILY_UNKNOWN			0
> +
> +#define ADI_AXI_FPGA_FAMILY_XILINX_ARTIX		1
> +#define ADI_AXI_FPGA_FAMILY_XILINX_KINTEX		2
> +#define ADI_AXI_FPGA_FAMILY_XILINX_VIRTEX		3
> +#define ADI_AXI_FPGA_FAMILY_XILINX_ZYNQ			4
> +
> +#define ADI_AXI_FPGA_FAMILY_INTEL_SX			1
> +#define ADI_AXI_FPGA_FAMILY_INTEL_GX			2
> +#define ADI_AXI_FPGA_FAMILY_INTEL_GT			3
> +#define ADI_AXI_FPGA_FAMILY_INTEL_GZ			4
> +
> +/**
> + * FPGA Speed-grade definitions
> + */
> +#define ADI_AXI_FPGA_SPEED_GRADE_UNKNOWN		0
> +
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_1		10
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_1L		11
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_1H		12
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_1HV		13
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_1LV		14
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_2		20
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_2L		21
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_2LV		22
> +#define ADI_AXI_FPGA_SPEED_GRADE_XILINX_3		30
> +
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_1		1
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_2		2
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_3		3
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_4		4
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_5		5
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_6		6
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_7		7
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_8		8
> +#define ADI_AXI_FPGA_SPEED_GRADE_INTEL_9		9
> +
> +/**
> + * FPGA Device Package definitions
> + */
> +#define ADI_AXI_FPGA_DEV_PACKAGE_UNKNOWN		0
> +
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_RF		1
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FL		2
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FF		3
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FB		4
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_HC		5
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FH		6
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_CS		7
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_CP		8
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FT		9
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FG		10
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_SB		11
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_RB		12
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_RS		13
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_CL		14
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_SF		15
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_BA		16
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FA		17
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FS		18
> +#define ADI_AXI_FPGA_DEV_PACKAGE_XILINX_FI		19
> +
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_BGA		1
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_PGA		2
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_FBGA		3
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_HBGA		4
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_PDIP		5
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_EQFP		6
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_PLCC		7
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_PQFP		8
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_RQFP		9
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_TQFP		10
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_UBGA		11
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_UFBGA		12
> +#define ADI_AXI_FPGA_DEV_PACKAGE_INTEL_MBGA		13
> +
>  #endif /* ADI_AXI_COMMON_H_ */

