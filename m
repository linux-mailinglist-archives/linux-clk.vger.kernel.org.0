Return-Path: <linux-clk+bounces-3125-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44184372C
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 08:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865421C22C5F
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 07:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1FC4D58A;
	Wed, 31 Jan 2024 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDD0J6b7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C65812E
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684912; cv=none; b=aAciDTkfo6l909WhnIL1gXpHq20O5XUnwFK96X/Jk6/5zdj+z5CZyvDizSqr5tpvEuWFDVno7HeHo+xEfA+vCzOFNTX+BsorRzlnoVnSgLioH6gv+1Vunzn6dWxVvob08w9DVzv+2ahcKfAytAdDdzL9znucW3u2s9lYgEKF4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684912; c=relaxed/simple;
	bh=6gFdtbR7kUCe62mAXevdADnV4rqouNX7oyE3b+Q5pV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BTaJid9QboNO2cgENZVkZJZfz6ZEzkOUcvEka2aUQK0hdK2kGqxZ3h1qUYE4HSmg7pPSNBtX9hsBMnKLAmx/Ox5EuU3AlC/XHDUoLcYHHW17ZqzkXKaZ326tHlisO+TGLpiFmvORYBPwF/FGtesensnKdWVRzMrh093Nm6uJlKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LDD0J6b7; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bd884146e9so4147308b6e.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 23:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684910; x=1707289710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwWXxX8bA04iBCBG5C5m4XA22SN5zaTxttTpsff3W6s=;
        b=LDD0J6b7BoC0dwLS+m8kqFEtqC0Cl/VNnchkfSncjDuHrzGHLtMBEOHjBOo/M+fOE4
         DbAApASnxL1PsUuAUfTIkTto+2v5Kx1f84lhbzwkP5TNVf1xCpIMGlmGl1y9Q62Z5jO4
         SPubyrzndNfrxuf50AgiR6rMpg7xBJtJK0Bw0KiHXaOH2xK60WT1zpRH5vKpZHj7+ASb
         Ht7vCEmSJnJOWY/90/rmpC5LlNAFHHvYzN6i2NJkvOmbPAKaa4hxMeGDB1ahki+9a6rO
         TkiGMRdZho1mfASgcyTH4ZCU7nVhBUnUQ/TGDnRkdytzyepMt3pTZn0wz+NhqopmlpcC
         FQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684910; x=1707289710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwWXxX8bA04iBCBG5C5m4XA22SN5zaTxttTpsff3W6s=;
        b=QhCC2vg8WMv6d6Pdygi/kcgbbrd7FDTM0/oJvPQILEV5lZt569x0htv5NmGxewBsfc
         KAMPdg9mUXmw1ExK+5WXZ4hiE42ZYtu4ap3COcGu7mG/LxI+gJjE0+aeXqFGJdraXeYX
         p4NQdwEmOuHaUY9wzebRqaaiIpd6T7dtk2vGkoi6MJT7nuoHY+BEiAhFoDRjg0pFC7Fy
         aD3T3MaSuoUvvrolQgiXkzPGbvOav6GnYdE/dICMuWKaOpSwf/jU6pHXPmNldy4VrnTv
         OdxjDKviyBjeNVSwqMAGwVBxFHwhYBvHsgJGMqxO5eFT4zKySU1OHOuJ1MXW3WDqZyKn
         3+JA==
X-Gm-Message-State: AOJu0YxJDGx8AUt2jmF2hJ1NLBC8cZMgJcgepCbJFMKbI6vxaSoDYVVN
	E79/QBDpAzwqxW58Fp3xR31hQ0X/Q0ISrdPLSBges6IJtoG5V8yO+E8T7z4J+A==
X-Google-Smtp-Source: AGHT+IFX3J0/GQ3aj+6X5/0qamhWKtXJIRcGHITNOdgjjxvwokAqlyynIe7k9LQEReXWhsccINPaUQ==
X-Received: by 2002:a05:6808:1596:b0:3be:bbdd:ea85 with SMTP id t22-20020a056808159600b003bebbddea85mr946862oiw.27.1706684909883;
        Tue, 30 Jan 2024 23:08:29 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:08:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:28 +0530
Subject: [PATCH v3 05/17] arm64: dts: qcom: msm8996: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-5-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=6gFdtbR7kUCe62mAXevdADnV4rqouNX7oyE3b+Q5pV8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG8vJFABRz1FHK0xn1RjAK3AuoAgTnI5cRQs
 7Zoa0NbAaiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvAAKCRBVnxHm/pHO
 9XK0CACANThkimoq3YF2AFIuFUn9WSXWyiTZ0i9Gpgzq+V/u8XlW38VpaxToMJA/wXC5uIYualx
 l5168bi4i8EGniCq3ZuxepF9kHhN5C2mW7ZZt0puujh8lkp2fzDzd2RAR86iT9x332mL1Ypz2p5
 QJpZxm1eOuT7TaFxqovq1uiqZdKh7x1gXTHJu1fTJ1tWuWolyVPscNj4MkhVjh7pu/cYmatdOgi
 WyzeYzLZcNjrsCmWBgoz3x3kJYrbHiQSet/RgCG47OlWGVUbmn3IY9HfVE5S3ZZVUS8vBmQXmwb
 cVxE7C3knU9+RUqvo3tOqn0BLqW/kkjcwWglFN4YZGFu/+ZQ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in MSM8996 requires 2 clocks:

* ref - 19.2MHz reference clock from RPM
* qref - QREF clock from GCC

Fixes: 27520210e881 ("arm64: dts: qcom: msm8996: Use generic QMP driver for UFS")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 600720d3a8f5..a691913b78a0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2123,8 +2123,8 @@ ufsphy: phy@627000 {
 			compatible = "qcom,msm8996-qmp-ufs-phy";
 			reg = <0x00627000 0x1000>;
 
-			clocks = <&gcc GCC_UFS_CLKREF_CLK>;
-			clock-names = "ref";
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>, <&gcc GCC_UFS_CLKREF_CLK>;
+			clock-names = "ref", "qref";
 
 			resets = <&ufshc 0>;
 			reset-names = "ufsphy";

-- 
2.25.1


