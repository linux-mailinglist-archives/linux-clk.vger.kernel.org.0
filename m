Return-Path: <linux-clk+bounces-5652-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A889DFCB
	for <lists+linux-clk@lfdr.de>; Tue,  9 Apr 2024 17:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76C761F239F1
	for <lists+linux-clk@lfdr.de>; Tue,  9 Apr 2024 15:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A2F137C4B;
	Tue,  9 Apr 2024 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="g4WKyRLm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C20413AD37
	for <linux-clk@vger.kernel.org>; Tue,  9 Apr 2024 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712678192; cv=none; b=QUpGEI18RHdcF0WWxO9depnrbHICGd9hteor9EE+20Yt0AfUeQzFk3y3aPP8rMP1zlXgCMqL55VdivCwENpfsLvGrcqgOCCN73afe+h3u1DiGqe2WxRA26Rp1f/e1KONHC6UYW1M6boMYu39FbQBmVw7MhP+EYkAsvDATWi7exw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712678192; c=relaxed/simple;
	bh=0EL7q48SD7Pfo4SF/I+36RQ47z0oPGDnuZvI7MsfOuw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Sk+uJRR3RiAFTBRjr4zMOijaAeCLlNFklSUaaObTZT4VhuIyJ3KOBZaGtakFl64ZXgf8MNVltPMAkudWHjlzU567NWPF7X7WJKRff1nB5IxinKDMDr892S8lrWyPVxC1rlO0IoBW2Yiw1V+4oAtXUPhZYkqxL4qGuPDGTijhiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=g4WKyRLm; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so81724091fa.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Apr 2024 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712678186; x=1713282986; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0L8Mm55Y48K0HRs+yI+LOWXO//blhz34iBiLgs48e8=;
        b=g4WKyRLmOYUZW92kG4mX72Lr6Aqm2slSYsLQcJbwxJJLUOmb6sg9Fvuz4OHPjqPxJP
         I8+W0HR7yq8C5hacS4/tO3ACvt+YgAG9ZvddV8lwqZW803IfUUzDmMlXaCy4xVD6TQfm
         DTajlND5Eu6u5g55Ny43Zo8XEQ4/hWOasXgkZCPX0Kq4yNGZBYOUQHT68VVjjUIE9Lwy
         AtNPQoNDtgWu6OUVWpMEzZzu33eThkWY1WkpN69lSiLWAYANK23X9fYAVS6VnaQnV+us
         geXytHu7B8Sd1iMBCWJa/Jvxp8UB3ecanDYKeEQUMPC5GlluYDcDwDKmouYgkXlu3g2X
         dKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712678186; x=1713282986;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0L8Mm55Y48K0HRs+yI+LOWXO//blhz34iBiLgs48e8=;
        b=LYb2u8nsPmhUHIArn4zklbBtSHnOXaxb3hBWP0NOP0pl3YKgPxhlljySxYSzUKFuMI
         BK6ww3u7rvmLDHBsXfcYbgRoPrgyfmaGevn9w0Am0KrbjloFgVjk7Y/VmHJcnVyUwa3F
         jUFx/UkQqBwx0M6Ceu80Vo/9skyZK2moCb4cgnDd/PJM3RcGpazSmW3enkMxtN50l+/0
         sgLv3yFnd0XdMeh3N9g7B31n4HlweY+AwH0qQUdMsGJrwJnWsrEgmOOsY2TJQMyAyZue
         I1XU75TTx3JFhOOzaG3maNjOz6bDO8dHezvgiDQGFM4x/9DkQl46y17/jA7w/JX7tNZR
         KOPg==
X-Forwarded-Encrypted: i=1; AJvYcCU+lc8Xmg/U4DgpvN2BNKfhbI+BxcZTX+1z3L6D9Xe4hCW9038DuIPcBD877HmI4dzDkMtf9ZH8MI5PUjZSSVIvjVL62I3Odw5b
X-Gm-Message-State: AOJu0YwL70c95GraixSGhs2DTQYwIoFAzXvgXMdXoTNhLXX3tSaGgzrU
	FhPdkr1XdMbRHATJam29UXuMgzNq9WyIvgHvLm0NzGpyTyat1TN7Msla56ELA9U=
X-Google-Smtp-Source: AGHT+IHv8WEAEFEW94VIUaX6ZXRBqEu0iL+Y5GIpF6W6uJOgCCs1uDXUoyf4bInd/WGDkbVNPs4YDw==
X-Received: by 2002:a2e:9994:0:b0:2d8:a889:172 with SMTP id w20-20020a2e9994000000b002d8a8890172mr157295lji.8.1712678186502;
        Tue, 09 Apr 2024 08:56:26 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z8-20020adfe548000000b0034335e47102sm11735519wrm.113.2024.04.09.08.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:56:26 -0700 (PDT)
Message-ID: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
Date: Tue, 9 Apr 2024 17:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] clk: qcom: mmcc-msm8998: fix vdec low-power mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use same code as mmcc-msm8996 with:
s/venus_gdsc/video_top_gdsc/
s/venus_core0_gdsc/video_subcore0_gdsc/

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

