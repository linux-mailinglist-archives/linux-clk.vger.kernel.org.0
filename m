Return-Path: <linux-clk+bounces-5361-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E508966FD
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 09:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5731F223D7
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 07:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E405D747;
	Wed,  3 Apr 2024 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExqxhjbP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357575C8E2
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712130405; cv=none; b=Kjoa3wBh9LmmkCdCxZTUNsIiIg6+nXXPpPxJExNLOfKdjqn35KDJMNf+nf765LqTl6QzRuPGLbkpiy5ucD1ptpei/L/Oorsjgk0Zn97TmRsgQ4vpq0scGpx0hKd/63qF+89NwGpLkg92w0FtEa7WBVhJ76QiyF9csAlmfsOraCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712130405; c=relaxed/simple;
	bh=N3wP+RQ7VRT4++7kCDqamWluNf4gtoR05YTHGQbChM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2Qtn7YYwGgfC/Sh0IAKqAn0QSmk2Ykkfl60m1tPVxwggbRkuG4B0wpybTs/QjtQnpOix0yW2kbT4ELujVygiumL7I5lBU6sR5O+8m9Z+gidUYLGQWew2C2vdJJd9nDURsoPfgnBneihw2gxgit6olHweivoGj+WHUto1YoP12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExqxhjbP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-343620589easo731687f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130402; x=1712735202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
        b=ExqxhjbPf/AQmWHe65MAoF+PZh9F3k9tZh+waBSLlvA6E/ATTTCdqF6uxHmulZx3Dz
         4OvNK/8NW3i3MvbHHZ38ULFOAMkn/J5k3EtZmsaNovsK8iSpYSqjSmn4CiKwQKDHeLmG
         RDgMjxcR941KPjwIkdka4/SnPREymXZq3OedbjczMVsXQuKEeeX3MW5mQT4mpnb+BcNJ
         qDEslTDwxPa9ZuIpjw+GhNQwIxIbWwq68nr/LH6TV+XPCwkOB+Y+VTcYPpTDcDzYJ9jt
         dwaCULePf6/OGVZrV0BOl9fWuqfGGL4RmqQGaxIBhElbz91JcGJV4lhdEM10ABGPF5zh
         BN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130402; x=1712735202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
        b=FEKQxuXHke6UJ3rgnqzSLFK503sgUOrXwABA1W253F4+Fv1YjTb9q/QN5s3vbfjgOb
         WgzVfbAioBFdIrPnNCLQp4Jfc51YnG+NFgAise4iaYnSyVC7fZ6tX77NGwIj09HPtKLY
         hmvMXYrTnLQJWwYCcrtiBxEOrbMhOmUGzBMlhjIiHJPGGUbzyoKLGcWZffbr8F2tvLQO
         XDB6DRMZktOEcJEcpDd7tyezBQy5EbX/kISaSByD7Tc+2ueN+owTWjAWbqvcnm187NiL
         t6JYYlyQdeRgYkwqu7qm0N7w5VXyzp7PXpwjYVMRzQtmBj4U1vWh1C3/PDfXWdke0Xv0
         kIbA==
X-Forwarded-Encrypted: i=1; AJvYcCXwN4oPae4vA6amqrXo3Y1T2qXYWeRA3cCyc8sWgJSAUtsaoZCe089bj4YYjY9I9qHmyiub8brOrwiyGC+LXfX7YCLZn97f8Red
X-Gm-Message-State: AOJu0YzliwhRwNX9pRtdikxP5RS6wrGF1tQiO5bs0Zecd2SW0B7AnqKF
	7ArKmcH3BiPHa+unr1B30Vcis4UCZyJdLJoB2GP3Si32S+yXNcXskSprbUgTLvY=
X-Google-Smtp-Source: AGHT+IFpo5g4fDFTNor1Pe0aeivWgmpXOELK6V5rSuDJZCAtGNmUdkMpcWyHvS/4yOhpE/5AVNdHSw==
X-Received: by 2002:adf:f48c:0:b0:343:3538:4ee4 with SMTP id l12-20020adff48c000000b0034335384ee4mr10426871wro.45.1712130402349;
        Wed, 03 Apr 2024 00:46:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:46:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:32 +0200
Subject: [PATCH v12 1/7] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-1-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N3wP+RQ7VRT4++7kCDqamWluNf4gtoR05YTHGQbChM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQldDTI+SzRhJHYhYdxII9aDRXpw4ZQGmnVanvis
 mpDKm3uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXQAKCRB33NvayMhJ0aIrEA
 CAjaaiTIpkxGPcKnI9vHfiZrWIDEIV5Fc17MC23AFXn9y6vUK8I6k8t8tjcY70647b9i10lUOnDW+u
 QTmTVl2J8iqRbWeZ0NUuJkvdiCgHXbuD9N3sJ6rRln1tpGfl6tzAsO1qDOmSoFxIzN3d1LMcisZ9IG
 EVOso7m5sSQYUpp1jUnx1mXDc1GS77MvuIvE7nwv1vmrkyUh53cxhK9wrFByd2ze7/fShUf2PNzW+X
 QDeYZbKG6/wq1fPfSCgK7mOS+IjpavXy8aWAIdNoKVvxK8vcv4EuGB2L7ityGXeqEu7h6CIFVQ1VoW
 oefOSy/kh9jS6GlK+SJBfSdsjHwidkgecN077CdoDspmvB0OSJTN094d0aVTTdZKLc2zbywRzs6TIz
 1IHqKljLDCfdlcuI/8tWs0x7PH/cJuXfwYZ+soy/2LONuf8tgFdVXUv0mHoh516guNw7vOry4s08iN
 IXPc1pYAakMqeuEo4oqLXAIrcZfJtQ7vNW+0miLYAa4LSP7ZzC5fcoNpik5doys5EZDbIDAJyHBnIN
 duMPHjicb1tOpnatuxPEIypWYT9DuaN5h57UxiUJ9FuDmEXZxSM8XfrmiNACLVNJmIa/j3792PWKEE
 RfyY3lIrcz8qTs59bJCSHXyezl31JWRG8Svl2gQBFRQN62IEUU7hiTBe9aCg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..b66b93b8bfd3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,6 +157,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1


