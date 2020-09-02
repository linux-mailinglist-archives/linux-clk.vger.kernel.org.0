Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC98225A3D7
	for <lists+linux-clk@lfdr.de>; Wed,  2 Sep 2020 05:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIBDON (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Sep 2020 23:14:13 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:37805 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgIBDOL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Sep 2020 23:14:11 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200902031408epoutp0234442850c6ae610dcb7660459fa22f09~w2PzPusBc3238732387epoutp02W
        for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2020 03:14:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200902031408epoutp0234442850c6ae610dcb7660459fa22f09~w2PzPusBc3238732387epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599016448;
        bh=IAp54r63wC5eXt4lOs9SPJLSMHnV4aBuK6uOyPSrTOE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=nSxno/wwDSbk9hIAsRjdkRXq8GWrwmFkzBAUpz9Z0Jh+YuO7/89snRews4L8OztUG
         qFRutS06fmdDNkXNc7z+4dJLeMT3hP/W3cC5WhsmFrTPT9luoYp7v5EUut7it6RRqh
         SAtvX4GBt2j7fZaSjR4l70c0bDPFotTpIJVEvX+w=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200902031407epcas1p3a71bc8b20a75b845998402ecd462769e~w2Pymc_nO2161421614epcas1p3F;
        Wed,  2 Sep 2020 03:14:07 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Bh8DD5sL0zMqYkg; Wed,  2 Sep
        2020 03:14:04 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        19.B4.28581.CFD0F4F5; Wed,  2 Sep 2020 12:14:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200902031404epcas1p15c3d1d53706a531d145c1ed5862ae00a~w2Pvo2ctw2057620576epcas1p1J;
        Wed,  2 Sep 2020 03:14:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200902031404epsmtrp1e439df9281ed4faafaecc71bffac5f58~w2Pvn6qqO1066010660epsmtrp1X;
        Wed,  2 Sep 2020 03:14:04 +0000 (GMT)
X-AuditID: b6c32a38-2e3ff70000006fa5-1d-5f4f0dfc3ba3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        67.56.08382.CFD0F4F5; Wed,  2 Sep 2020 12:14:04 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200902031403epsmtip1462a8aa3b7f84f4de61f6e4f835e0f71~w2PvOMkym2908129081epsmtip1e;
        Wed,  2 Sep 2020 03:14:03 +0000 (GMT)
Subject: Re: [PATCH v2 2/4] drm/vc4: hdmi: Add pixel bvb clock control
To:     Chanwoo Choi <cw00.choi@samsung.com>, nsaenzjulienne@suse.de,
        eric@anholt.net, maxime@cerno.tech, stefan.wahren@i2se.com,
        dave.stevenson@raspberrypi.com
Cc:     devicetree@vger.kernel.org, tim.gover@raspberrypi.com,
        sboyd@kernel.org, mturquette@baylibre.com, kdasu.kdev@gmail.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, phil@raspberrypi.com,
        linux-arm-kernel@lists.infradead.org,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>
From:   Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <da50b700-2566-2b5e-766f-77621405c8e3@samsung.com>
Date:   Wed, 2 Sep 2020 12:13:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <46e051f7-ba72-5960-da95-a2e9c44d2d85@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbVRz29N7etki3u/I6NiqlWRbHwqODzsOgm5mA1+AyDIlzS7RWuBaE
        PuwtxG1GOxhkQ97LHlS68ZDxmEwHyCtWCCuCuMEQ5LUNBoMtgICMgYoTbXsx8t/3/X7f7/ed
        75wcPiZaJ8T8BK2RNmhVSVLCBW+4sTPA76nwkDLQ9osvqsnuwNHQk0dcNG8pw9FlWw8XDaws
        EqjtZD9AixWZBGoeqMFR7YNBLlrKGuOi/pYiAuXf+YaHLv6xDlBfdwRqMFcQ6NroHIHSrTYe
        Wh+8bh+oHCbQ5Llx8Io7lbr4A0EtDqfzKPP4LYK629NLUM3mezzq21E5VVt9hqDGP+/kUHVf
        fkald6zhVE59NaDqfjpBLde+GC08mhgWT6viaIOE1sbq4hK0aoU0Kkb5qlK+J1DmJwtBL0sl
        WpWGVkjD34j2i0xIsmeVSlJUScn2UrSKYaQB+8IMumQjLYnXMUaFlNbHJelD9P6MSsMka9X+
        sTrNXllg4G65XfheYnzJxW5CX+X2cdG98xwTmNiaCQR8SAbDmYm7eCZw4YvIJgAfjv0KWPIY
        wMme+g2yCmD694N2wneOVBWGsXUrgCWNWRhL5gFsy6vhOva6kZGw4Hwp4Wi4k8UA1ty84iQY
        eQWDXSVtHIeKIP3gStaQEwvJfbDx73nCgXFyO1yte+Tc5EEegc3TMzxWsw3+WDiFO7CA3A/X
        xi85NRjpDRvnizAWe8HRqcschxkkywTwz+VqHnvucGi55cGmdoOznfU8FovhTG7GBmbgQOEs
        zs6aAMzN/2KjEQRby89yHHswcif8uiWALfvA5r8sgPXdAhdWsrislRCezhCxkh3woamNy+Ln
        YXd2BYfFFBxZ6MHygI95UzLzpjTmTWnM/xsXA7waeNJ6RqOmGZk+ePNz1wLnR/BFTcAy/5t/
        O+DwQTuAfEzqLiwcPqgUCeNUx47TBp3SkJxEM+1Abr/rfEzsEauz/yStUSmT7w4KCkLBsj1y
        mUzqJZwYlShFpFplpBNpWk8b/pvj8AViEweKYw6XaK/t+n05dOy7cq/jXYe+ivLJff39T73q
        2nekzm27qugbuhCV4rrGP9qhUdhyB5aiXMLSJnNe8BOsZCx3UZWTQ9sbrG+W95WOmAwtogMv
        TX4S0QosvOc0bdenm7StkXdcPHEvyd7Qn42zgwv3n92lvyqaNuUf7rVpXcWnBd6PW9+NiFJb
        XjN6Vj6dmQpJLzpTEd1vKNsfXVD70T/9nO60U9neby/dXLVaT1kLsk4WBKHUra3t06IPlqmc
        Yw9Kz4a6xunqO48sPkOlZcccOFF+QV9VB4tv5Manhb8zNxPpG5uXctvWW/jhbcuSInt0ZC3s
        vrriSct481sFgsAtTUWVUpyJV8l8MQOj+hcnjp7MkQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Rf1CLcRzH+27PvntaN5628BXHWcWhphH3nXPlH+7BdRz+qTtl8qiuNrMn
        WuGKu9CUX0dXz8Vq0mqn0CKry9HvmJ9RXZqMVn/QTdcvF8KKu/57fd6fz+vz+eND8iXvCX8y
        UZPC6DSqZBkUEQ8aZUtCfop3xoY6jQSuyG0mcNfooAAPXb9JYGPTCwF+O+aG+PGpDoDdZgPE
        trcVBK763CnAwzkfBLijthDiy+/vCnH+9ymAXz/dgh9wZogre75AnFXfJMRTnff+CmXdEH+6
        1gc2+9Gn3S2QdndnCWmu7zmke1+8hLSNcwjp+z3r6SpLNqT7zrfyaGtJBp3VPEnQF6otgLY+
        O06PVC3ZJY4WbTrIJCceY3RrwveLEorzn0JtuVRf6MjjZQLnXAMgSUSFofKCTQYgIiVUHUDZ
        uZ3AALz/5ouR5WK1YGZGihobWU8sob4A9Kon1sNSaiu6kmeCHtePKgLIYjYRnoJPlfDRr5Hv
        YGbrJEAj7rvQo0AqBI3ldPE8LKbCUc2voemcoALRuHVw+to8KgrZHipnRnxRe0E/4WFvKgJN
        9t0QeJhPbUA3rE7+DC9FNUOF/3gB6uk38i4BCTdL52Yp3CyFm6UUAcICFjJaVh2vZhVahYZJ
        lbMqNXtUEy+PO6yuAtP/X7XyIaixfJM3AB4JGgAi+TI/cUF3ZKxEfFCVls7oDsfqjiYzbANY
        RBKyBeLuI8UxEipelcIkMYyW0f3v8khv/0xeUpc583zrnol622COPvSqaSxpqdQig9HDwwN2
        U7h+dUtvUtkTa/myEse+ogORWTHBaSMuF3zSLvbpL659Zo5KvPMDV8aTbX5c+sY7x+f9nvD5
        WjrnkWJvXWBcmGxHRIVL5NqgbrelnnTZm1IrV54JkjtjlO4TxoyPuZphB0pXTLUG2d8ELlyz
        cVvAxwF7xKsj6cXjXr0+Xr5TF/q9ql8myOq4K207Mmp3r123R7lPf6yaWH8z9HYZWnHorGHF
        o5P7J24td0Y6jK3Zg+PvJuIUBEb67fd+KssShQdSO4JrR03s/KDJcmXauWheSqM5KtkesCxg
        tF7qr9aWFslzW2QEm6BSrOLrWNUfhQrnrm4DAAA=
X-CMS-MailID: 20200902031404epcas1p15c3d1d53706a531d145c1ed5862ae00a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200901040851epcas1p3124094e38175758b2310bdae6d76793c
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
        <CGME20200901040851epcas1p3124094e38175758b2310bdae6d76793c@epcas1p3.samsung.com>
        <20200901040759.29992-3-hoegeun.kwon@samsung.com>
        <46e051f7-ba72-5960-da95-a2e9c44d2d85@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chanwoo,

On 9/1/20 1:27 PM, Chanwoo Choi wrote:
> Hi Hoegeun,
>
> It looks good to me. But, just one comment.
>
> On 9/1/20 1:07 PM, Hoegeun Kwon wrote:
>> There is a problem that the output does not work at a resolution
>> exceeding FHD. To solve this, we need to adjust the bvb clock at a
>> resolution exceeding FHD.
>>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> index 95ec5eedea39..eb3192d1fd86 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -80,6 +80,7 @@
>>   # define VC4_HD_M_ENABLE			BIT(0)
>>   
>>   #define CEC_CLOCK_FREQ 40000
>> +#define VC4_HSM_MID_CLOCK 149985000
>>   
>>   static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>>   {
>> @@ -380,6 +381,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
>>   	HDMI_WRITE(HDMI_VID_CTL,
>>   		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>>   
>> +	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>>   	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>>   	clk_disable_unprepare(vc4_hdmi->pixel_clock);
>>   
>> @@ -638,6 +640,23 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
>>   		return;
>>   	}
>>   
>> +	ret = clk_set_rate(vc4_hdmi->pixel_bvb_clock,
>> +			(hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
>> +	if (ret) {
>> +		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
>> +		clk_disable_unprepare(vc4_hdmi->hsm_clock);
>> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
>> +		return;
>> +	}
>> +
>> +	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
>> +		clk_disable_unprepare(vc4_hdmi->hsm_clock);
>> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
>> +		return;
>> +	}
> Generally, enable the clock before using clk and then change the clock rate.
> I think that you better to change the order between clk_prepare_enable and clk_set_rate.

Thank you for your comment.


As Maxime answered in another patch [1], there is no clear rule of order 
here.

[1] https://lkml.org/lkml/2020/9/1/327


Best regards,

Hoegeun


