Return-Path: <linux-clk+bounces-16369-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999E9FD4B5
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 14:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F55B165B3B
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2024 13:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9391F4708;
	Fri, 27 Dec 2024 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJsmKB8v"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711C1F3D56
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305140; cv=none; b=G/T3ounObYD/Zix0bt4VSUGUihdoB7w2sB5mHFadrovZ5wkWZUEtsAVQIiiJtg3hhz71dXeITAoy6usMkSZkx64M1UqkMk37u08I94sA/KaBrp8BAlswlxTGcFoUnpSHIVoNV0n16+kjjJE3jrTCzzI56amCSLbbbrV3Yvvdr/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305140; c=relaxed/simple;
	bh=1A1Mz6E7xYN3MvaSfjeMHy8CNatmsryIlxCYCFCun0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCZPnnGO5S/qKjydAJxZTbszeXsKA6CSu/KwZcAbSZKcG/BoV1o+HugfzpH8ep7ywWdxwgvzS/ZNAFsdhxL69CpgeUTuQpNe7o4kMT+gpdceeYoJMARzdFXzyI7hJtaGeodiaa4sEbf3QqjSDa9yihuhA1dgDcUC54XIpuUBJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJsmKB8v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso76575245e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 05:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305136; x=1735909936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDahXDiMrMFuseveKIbLBTZHpEpgxwm/BpoTDKiwlh0=;
        b=cJsmKB8vX2Lz3C8MIWuIdxm5vspBb3Sea2Kc2oHqf9bFgDDhJUrlIrRs8dnhFh8Do6
         SEffhBT8HoHZn87MGLQmszFe1kNTjHp+9NyvCHTe7xGDuAfA0Ho0JIT4Sl3SZjZkmaNc
         0K8usf6LF4vZLoZ7cl//E3djT5LHsdb+NFSouY2X4nG4TszSHmFOp62OAwcuBpZ2w+gh
         371JARzawb2VRA8S6zz2ZJXIurNHBFDL2QLNN73lE0n2wcH/R/UbIf7JQmY4Ugmm58UW
         mlhwWSIrUGJHz/z+Zi6hyu4mHOB9DSbh4PWqa5A7Aa0A/2vYfb5P1UMDPNzHQYPB6Ixd
         /R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305136; x=1735909936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDahXDiMrMFuseveKIbLBTZHpEpgxwm/BpoTDKiwlh0=;
        b=bsjUjnHbykFVQ+oAElZy/kofyxCJAzp/vQCd8vNbOQURmt/4JwjPKugHBjA6NYS3T1
         T+8kGZ9GuwyG9Oo2W1pdC13aSniPqu4ySSHEPcK/qg6Ro3sSilbsb9k13KKwMPQvEcx5
         joevpZ+GQdaidlizmSWnAV2BZCUTlVbFliDRsKkb0A+9EUkSTksaPQzJ/VFrcIQopELq
         CrKZ7jRV4B8MQPKvLv1v4jxPwbZavbLl5KurHyo3DU6uex4QN6S28uF4sOXGIvMnISCV
         JaSfkEv9rxWxBqPM7xLHxwGzBQh4ixIKybmCnTrjdTsJpLMAN1lvkz2XSjqS1b6SamLw
         xZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCWli4RQMvWDTeXWb3gfHOAjbOfPf2MDVJyct/8uHI9Pcwh0/zS4aJHocQcX4mecaSrxJemPsL+kZ70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7aZvQTqeYJHypCTvoR1ktY0wqvguZLjpvqZwukR+NTutIjLuD
	x8jb/Dm8kO4jwb48qw68KEOnQ+pse/WVCpvAcxEgtqd+qoC+YI3euKNyyXOtkbYcd0MBs19WvBA
	Z
X-Gm-Gg: ASbGncsgKti8loCQMT1a36Y+2X628jaNL8TpbrDnuAmS9IXY0C9P+x7Hsj/6CRuGT9O
	AtC9bu69D1P0Gpale3YsMFmytogO8YZdZqGqikO64Ql9ArxfTMabQ8YCQHd8OVYJEj8g8PyMsoa
	Y48PZfYqq54oDBWeuB9QjqzuVkQtoSfOU9pehDzEDOKAXuKoNll9hIepXbT07zvfajZ4bNJvTkI
	S9dzdNYAzOtRMJzvJfcaeJ3OeV69fYhjBKAjSfztlW+qj08PynLdcVbSbZwp8lhZA==
X-Google-Smtp-Source: AGHT+IGAmEDxQC3LgNG94AqFNSpl7gwcE78FuW8AtAJgn7d20DM376eooCqV2MdMQ77nXSgpIFUobA==
X-Received: by 2002:a05:600c:4586:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43668a3a3c4mr205128975e9.21.1735305135904;
        Fri, 27 Dec 2024 05:12:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:35 +0000
Subject: [PATCH v2 2/6] dt-bindings: clock: move qcom,x1e80100-camcc to its
 own file
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-2-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add an x1e80100 camcc binding. x1e80100 has two power-domain parents unlike
other similar camcc controllers.

Differentiate the new structure into a unique camcc definition. Other
similar camcc controller setups can then be easily added to this one.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |  2 -
 .../bindings/clock/qcom,x1e80100-camcc.yaml        | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 0766f66c7dc4f6b81afa01f156c490f4f742fcee..b88b6c9b399a4f8f3c67dd03e6cfc306963b868f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -19,7 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
-    include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 properties:
   compatible:
@@ -29,7 +28,6 @@ properties:
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
       - qcom,sm8650-camcc
-      - qcom,x1e80100-camcc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5bbbaa15a26090186e4ee4397ecba2f3c2541672
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on x1e80100
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on x1e80100.
+
+  See also:
+    include/dt-bindings/clock/qcom,x1e80100-camcc.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,x1e80100-camcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Camera AHB clock from GCC
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  power-domains:
+    items:
+      - description: A phandle to the MXC power-domain
+      - description: A phandle to the MMCX power-domain
+
+  required-opps:
+    maxItems: 1
+    description:
+      A phandle to an OPP node describing MMCX performance points.
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ade0000 {
+      compatible = "qcom,x1e80100-camcc";
+      reg = <0xade0000 0x20000>;
+      clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MXC>,
+                      <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...

-- 
2.45.2


