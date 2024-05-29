Return-Path: <linux-clk+bounces-7443-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A996E8D39CA
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2024 16:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 280A4B25779
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2024 14:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D89181D14;
	Wed, 29 May 2024 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U55L1swb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD5181B80
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994033; cv=none; b=JnQeAJsysrbMFrI+yGFQ6hfV0aCDwCHsDQGgY/ip1vL/1kKoKB1UdcwYS7on1qavNy92B1S9i2KppMc9ZoT5RWKVPuAXrqbkdPH2TMIfyu3vAZVcBzKbFP8WydCT9zbjK7tjQOInPjdjKRXT25WeIQSlHa4P8b6IcZ5NTGUJ1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994033; c=relaxed/simple;
	bh=HJLaCV8kZeQsHgpVRROJnMjh9Abjsmo5qtkKQDyGFFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNImClgbv6QDrhmGB1K/2iDsX0yPhYGEKIxZZWVYP0lJMGt6cFOv2MK+ktUgM7FPd/dN959nJezE9m9K51pq+OTlbO3TdKEjY0wk8vOxoHa238fs0l8a1twIY4nopVhzpoGwrzRVXw7RabSnYlaTXn03WcZfJOdPxwSkC4bS+9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U55L1swb; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e968e77515so26661201fa.0
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994030; x=1717598830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=535MyUxB8spFHdswlkTuyB9uo/nAHtaSMiVAH5TZ5lI=;
        b=U55L1swbTTwN47ToLbLSWu/wvfVfzpzpmmOkq0eiQKHh1vgGHnXsKzeaDnsFUws+Hq
         uOywkk0RVdlwhXR3fTj1dxxUP24BGenxidoN0Z558YuZ3zR5U3PdUdRwQlOaPKAm+m7K
         22gar4jIr/aidfvajjA10uQD90tICjd4gsbJrIr+dWMXWsJAsCsHxOhHrFIcfltAtjU0
         USOSKMZ+vYVqvcwAAiO9IwYOpBrMYXgXUd42VLzq81gpxlp8vgYg5Y3fCOB+Fk0Z0ww4
         nObFdGpL7741g19FDz6gZ6Q3CeEKRzDL1NspyOCgVKNyM28999e06mJ1Xr21xXxIwhxm
         h+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994030; x=1717598830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=535MyUxB8spFHdswlkTuyB9uo/nAHtaSMiVAH5TZ5lI=;
        b=q1oJGE6gUM50ckYZ6S6++zasNwM27TdNzAiZyiR3m/Bo26u6vYhWV2CK65Ziyr9U8u
         cTUQd5PlPVrnjYcTNdabxOBwarS35Mo10j6E1yP8H425pGeX0j5Wl1UdccpPi5vyYHft
         IrBnP6fVnAdru1V3M2tqGPjb0Gyf4St+/4k6oQYlkHtMfna4UBkWEnH5JiLtsBAupoN1
         CssXTVtPy8OyK5vWUB9ThUKB8Rd37yhyYcsBScoOsESxLobLGr9dVesc0DtlVd/nPDXM
         ePuW5nPqv1caI0Mu5QyvDc7mvs5ZH57538kvZWIgVrCjcm+QGadzSXnnMu0VD9ReBdPL
         /EHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnNrNIe66LjM3oPsF1j1nfmVOiN2VieuX6/BDUsKa/Eq0DNHyvQrcDVg5RJHz58EOCiYME/jBMdfd9zLLn40wJKvtIdItkGugy
X-Gm-Message-State: AOJu0YxzBX/eZGKU3/7XGrwsnEMl0eO+T1a7IKxSsd8GCyRAaUKbjeDe
	yksQzxPDFIHG8At55P0x7qxLIxYk/fhRL0ThyHc2jPBjjwdrPupgQd9Kcik8A/Dw+Chu9pNb5mZ
	G
X-Google-Smtp-Source: AGHT+IHAInG/3QKFqcat237EvBd/lUztoEzjSsJjdmPqUd95JEW0srXcBB7A6LHULPcDLAEMyNBDNA==
X-Received: by 2002:a05:651c:554:b0:2d7:1a30:e881 with SMTP id 38308e7fff4ca-2e95b0c2338mr115629481fa.12.1716994029945;
        Wed, 29 May 2024 07:47:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:07 +0300
Subject: [PATCH v2 09/14] ARM: dts: qcom: mdm9615: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-9-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=813;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HJLaCV8kZeQsHgpVRROJnMjh9Abjsmo5qtkKQDyGFFM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/lhJHnhkiyUTgo58PJib3j9FrnjcDsRw0gK
 FMocrWoojeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5QAKCRCLPIo+Aiko
 1Tw+CACySY0s7eo0HUEnEvAm6Z/5r9Q7AgJw4mHiTRxx2GamFY6GDsMN2/azZG01/W+BfXW4jCi
 wjm2yMMn2OAtRx5bzj8YO7QwL116DmGOCTsTajiiLhGJZRcDd+Qp5wMgjcO0ER/YuhFo5kZrmS2
 hTLue3bt2kVL4gUAfXk8EHej6g1tlQN3mM6uY0bHc1wQnbMWG2sCb8j7tvKPMK9WjbNnhpNR/Rt
 3FEfZJPEc4IcvcCGVAH1dNZs60PoNGySckuXuSJEs5CDqN0oo1jHnWhENz8idpYH+R8XWTMk/X2
 QxpdCEMN230/Z0vK9M3NMeE+yQfu4JBmwAJ67r04w+jbcV+E
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On MDM9615 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index 34c60994d026..573feb3218c3 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -102,7 +102,6 @@ msmgpio: pinctrl@800000 {
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-mdm9615";
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
 			clocks = <&cxo_board>,

-- 
2.39.2


