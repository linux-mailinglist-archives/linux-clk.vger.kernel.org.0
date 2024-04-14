Return-Path: <linux-clk+bounces-5689-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3189F070
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 13:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08FE2B212A5
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 11:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C3F15958C;
	Wed, 10 Apr 2024 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="JiKU+ajZ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5B7156C4C
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712747603; cv=none; b=IwEUufiN3igYoMAOyxuwgwHrUY4q/mJ9ifRrgzJ63kmEoeJYq2bsL2tw9ihpnk9sfTYjW3ikI42vE/B1dtoeGSKZfY/jOmgONq8mLHQeV8zjchshF+TEJEFRQBIz3v6RXmOiENA7GxTBR1wdYYuOIGsJ4MLjZwPvsZuronWyCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712747603; c=relaxed/simple;
	bh=XeuA3NrVWPGkTn498HsDuyaTJEuoIRcx1onTzVabZX0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=fOeEeQPEKpYjQMHajZov9HYDDPpQBHXua3pZwWuPjd9BxaCorXwS1ElmSHPkN5rj+KSBYjQ29okV/nSE5Ghzr89XYhDR0j/hPPYSUIAvGkWs5hViJ3nrPxC5fuQRIytp/X76hCNQ68d3yq6xZiW8rp5rmHtb/Fe3j+AYqNL/DBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=JiKU+ajZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343e096965bso3578479f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712747598; x=1713352398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HKFpmuu1KMBmbkUJ3fwnRVPG/ZHsY5ZW+FDeBpEHiw=;
        b=JiKU+ajZVOtauK2yxyt6wcHmjxLuW0ebabrJ23MSpExowSe+3FT7JknC4UDgYXgWu3
         Psa6m1soLXtSptr5EkvWQCFUJjuN1XStnmftmyikyv3H1tUugDnmVUyR/83g5OTJ+4ef
         fRlfd+lCwjZga6M+0Jh9Aiw3SUdGVK+aGkCLLOLM3TY0q4ssLAQb8K3h3ECRDTOMhxr2
         3X3R9IlNuh27t/8Xkl4jP819ydRqgsyO9NImlKpbotYs/nIsx1VHIzYi8/qomVCnbWsq
         GAzipPzSsCmgac+Pj4h9GtYqVwfRNe0nv6b+ixF5ldEOYwiSkqQwNUYB2GXdXqpBDa+Z
         9ejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712747598; x=1713352398;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HKFpmuu1KMBmbkUJ3fwnRVPG/ZHsY5ZW+FDeBpEHiw=;
        b=c+gRwazp9b6jYZuvXg4OarclJrOOnqJkJ88zsrknfImS9U5CAhSjPoToWuhBEBHdSE
         D3ag8tlUmFinJqL3VSwGWS4/k1lrugrnCZK85WukH1BJe2cCwKrz/cSZN2ia3fuvm0aX
         pYCM/+iscCtfQ+2LWBAfJfobyVJFRgiHJPc8MX+Cog0XVSFf4Aj3mFK5BlnNCuH4v4Xv
         /1IevwJb8cMgLLjGCniJogu357qC13anWbrGFo6+XlTCBRv/3CkJ6kWTova+Xu9KMU8h
         ec84IobXAoxzvMnTyXT+/+Bfzt1dDTxqDdL/OTWWbvaDc7zyjvUmO81ApvAmgujZiYHS
         Kbxw==
X-Forwarded-Encrypted: i=1; AJvYcCXUNlKxBvT9fUFQ0Hz1W/BIr+ncGgErGRAMSnfRt15jscGEqEusXHaT4g20MYbaIyQMnLPcIGp1t1M3qk7F2KGlsrDIRR4RpB5c
X-Gm-Message-State: AOJu0YydJmabriGoqBJENbgJcW91tpM9Y01bdTBk44vJf1BKbTr81qHZ
	c29wOZiMFsh4vVsgWniLl3D3Bikk8aqR5+Qh29B+wgjZlWvs0XdgoS5sNCzEreQ=
X-Google-Smtp-Source: AGHT+IF1RBPfANmKdUKseFuT8wy8DqIz+vjtXln52+Yj0M4DBcVvz/iDK2uSGBeHKt5uZOF9Q2tPCg==
X-Received: by 2002:a5d:4950:0:b0:343:7228:f70f with SMTP id r16-20020a5d4950000000b003437228f70fmr1886567wrs.61.1712747598486;
        Wed, 10 Apr 2024 04:13:18 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:bfb2:9137:62d7:74db? ([2a01:e34:ec24:52e0:bfb2:9137:62d7:74db])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b003439d2a5f99sm13484289wrv.55.2024.04.10.04.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 04:13:18 -0700 (PDT)
Message-ID: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
Date: Wed, 10 Apr 2024 13:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Video decoder (venus) was broken on msm8998.

PH found crude work-around:
Drop venus_sys_set_power_control() call.

Bryan suggested proper fix:
Set required register offsets in venus GDSC structs.
Set HW_CTRL flag.

GDSC = Globally Distributed Switch Controller

Use same code as mmcc-msm8996 with:
s/venus_gdsc/video_top_gdsc/
s/venus_core0_gdsc/video_subcore0_gdsc/
s/venus_core1_gdsc/video_subcore1_gdsc/

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h

0x1024 = MMSS_VIDEO GDSCR (undocumented)
0x1028 = MMSS_VIDEO_CORE_CBCR
0x1030 = MMSS_VIDEO_AHB_CBCR
0x1034 = MMSS_VIDEO_AXI_CBCR
0x1038 = MMSS_VIDEO_MAXI_CBCR
0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
0x104c = MMSS_VIDEO_SUBCORE1_CBCR

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/clk/qcom/mmcc-msm8998.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 1180e48c687ac..275fb3b71ede4 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {
 
 static struct gdsc video_top_gdsc = {
 	.gdscr = 0x1024,
+	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
+	.cxc_count = 3,
 	.pd = {
 		.name = "video_top",
 	},
@@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {
 
 static struct gdsc video_subcore0_gdsc = {
 	.gdscr = 0x1040,
+	.cxcs = (unsigned int []){ 0x1048 },
+	.cxc_count = 1,
 	.pd = {
 		.name = "video_subcore0",
 	},
 	.parent = &video_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc video_subcore1_gdsc = {
 	.gdscr = 0x1044,
+	.cxcs = (unsigned int []){ 0x104c },
+	.cxc_count = 1,
 	.pd = {
 		.name = "video_subcore1",
 	},
 	.parent = &video_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc mdss_gdsc = {
-- 
2.34.1


