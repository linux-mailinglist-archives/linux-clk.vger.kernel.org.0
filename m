Return-Path: <linux-clk+bounces-7447-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0A8D39DC
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2024 16:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6907D285E01
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2024 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D61187328;
	Wed, 29 May 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0B+x+To"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164E91836E4
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994037; cv=none; b=E5x4NuZ6ygmfWYWviK+JNcJwV/AmL5XJ2OFZRTxSyuRuNTh2Q6sdUkfbvtf30lc0baT/iY4Xvd3e3d73JU4pN88eaBz08fgkht+kA0D3QuXo0yzs14QKos0doBKqJoWcOIEA9DmE4FsLt+s2wE4eKknTyu6CZlqkQtLHh9m8o8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994037; c=relaxed/simple;
	bh=XAt6DL1VR9hVvuY+93ZuaPQtdbqMKNXUv5SdCXSc/Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2UxUcOg/i5EXKvhk/HrA6P51vIJAk7pwYlA40TVwOJzQiQCwP1l0S1xP20+Nh3bt2HDvB62/J0n8cJ+pmZLOPBMJg+xZXxh/W+gRZn8bQE1cm/71wvmQ/24qEmPUZxoNLns+wGEUZWSqVPr9IG9M7V4P2x8PsqvcDWMprwsA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0B+x+To; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e9684e0288so27462671fa.1
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994033; x=1717598833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVQnFMigylZLrd8REetB+leXaGU3JW+I/8fg5hchdrs=;
        b=S0B+x+To0RVDZf+621Ec0gPzGOz2yVz6OUZwKqrcIVbXkjT764ta4NLkgY3x6gpncy
         58Ub1lHlmhzLyKr2o6bT0gxH+iCJQ/Qhw/jraORDUEAmkyEw+Cw2HHPQks19Bv8+Uj3/
         pP+Sm0/sizEOf7nltxtquuMhq6ObX6ZMih9MH5Tilm3FlmjAYJbs3Ykb67ul8IbMsc8L
         KWqkkPE5ARbzJ/d0XSH0tMBD9KmF7Y5R5kteo1NL7qAHd7aYttYOMUMDaepz6P9nQAbK
         TYRzNpEi86X3ZZSAXoHsS9Nepabd1v8DLoAiTutY0EBCK3uHYilCwQUUXA0PDLLUtW3p
         Cjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994033; x=1717598833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVQnFMigylZLrd8REetB+leXaGU3JW+I/8fg5hchdrs=;
        b=pbVWFR07lfpF0HDAbTeaKc1XT2Ue3O9Q2ci3ztfViMxC4CM8dNxX2poRI5qSUH/vbP
         aVRabSV8j+P1Da+YfCrX1YuqgHBRuNZyPGyMiF5CQhpcJ3W783oYsWifruMOPr4lyc7n
         OOKLz7dT5vJdAKNtZIL/hrNFyXVOcYwwdhbo+FEH7+PTB/JnExio0Yt8mhlcLDVwVNjs
         z4Y0ntI4EHkvYbVFI81HW9U72M/y1ka+7EBUc+2e0r2WOv1Qu9cUUkP9GBIusJbeEBbA
         GznIWwGKCP9XMVW6JoJtQRuCqeozqnY1ZG6GorRIAmoTattr3nZk7YFXy3Jj82A1LeLF
         9MHA==
X-Forwarded-Encrypted: i=1; AJvYcCWCnbGMrQx/2A+2DzFHQdgOEZQ4AqNPbz9hID0ZrGiL0TshDXHrFty+ZaktFxg4+Dz1xXGi8UAqtH5BQuamoOlO6R0CK8XLXV5C
X-Gm-Message-State: AOJu0YzekG/fzbDCcQidZYgUXeIwG7dgDTBE0M0hf3xY4+gZWAtHX+qO
	gmetk7K84ecqwXj0/WJyNZTNolRyagC00bM+9R67dBuKyYbF0Rz3mUJ/PP52vNo=
X-Google-Smtp-Source: AGHT+IE4/Bdi8Yy3nlcB6YDgswdyud9MjVAGTsjoJ8cPyrSw3RlbHHrEBh1C50PvfGgu7jLje6LN3Q==
X-Received: by 2002:a2e:9bc7:0:b0:2da:a73:4f29 with SMTP id 38308e7fff4ca-2e95b0c57c4mr137659351fa.30.1716994033408;
        Wed, 29 May 2024 07:47:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:11 +0300
Subject: [PATCH v2 13/14] arm64: dts: qcom: ipq6018: fix GCC node name
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-13-69c63d0ae1e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XAt6DL1VR9hVvuY+93ZuaPQtdbqMKNXUv5SdCXSc/Gk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/mo7DOZ24IcjHMnwKdD9EIgRuh835+zXHuz
 8wUO7QPMciJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5gAKCRCLPIo+Aiko
 1WoxCACd8LgA7msfrqZUx/eJhT15wHk6itqVWHjmgo9yCaHRjrdx7h/ObJ1Ns209J/6TlQp/PaT
 4mCCtbzMXocLGVq3s6Ht4YPYAU/rQTXSvbpyoXOsf1ofRjPAGB55X913pYeMsdIwr3KlMu7Yi0B
 LTzIEyZRd9WdvfRQKusxhpca0w5kCzgbx87/hlc6MXXmK9h97HrkP9r5CNxlc3yAzhaEeCDicpg
 7qZtPYxyVy/uvUbvdba+q22xF8BmqMgHTIR5TTDO63cE0xWRIH+Urj5TPCvFo6uVjpY42eJ9/Jt
 huISK9ewri28gQInf8iRejl5qZpWC56PulJ1RLtQh9oznIaw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Device nodes should have generic names. Use 'clock-controller@' as a GCC
node name instead of a non-generic 'gcc@'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 17ab6c475958..a84cf62d843c 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -396,7 +396,7 @@ qpic_pins: qpic-state {
 			};
 		};
 
-		gcc: gcc@1800000 {
+		gcc: clock-controller@1800000 {
 			compatible = "qcom,gcc-ipq6018";
 			reg = <0x0 0x01800000 0x0 0x80000>;
 			clocks = <&xo>, <&sleep_clk>;

-- 
2.39.2


