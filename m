Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF19B7E1BF7
	for <lists+linux-clk@lfdr.de>; Mon,  6 Nov 2023 09:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjKFI0N (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Nov 2023 03:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjKFI0M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Nov 2023 03:26:12 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275B5184
        for <linux-clk@vger.kernel.org>; Mon,  6 Nov 2023 00:26:09 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso29575405e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Nov 2023 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699259167; x=1699863967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUKa+dq+yboEToV9c6wS680Ux5CIHHimAdjadaUPKj4=;
        b=yiGtXIdE2M3yQ7P3KOu38pTKBYQhVqzfjAcieNyRjqeze9c0trLOfd8buGWr7z84Z4
         RrzZTwPZ00K9h5/9a//8onp1Jhg3Ma7/3n7+5sD3R2nwaF9AjAyGQYVessT3la6hkD6x
         kcC2ouX/FIB1WO/EOPH8X3KerLBIJ1cAhKgs2qgHhr3qVV/SZoJKPxM72EHEPlFcQsfS
         4DJwVR46AT+80P0lvb9DDdqvjlqjBpwu3q7jfjebO2Z6iOwy2mw8Zd/sNHsgRs4U8F6u
         qjm6/i3QXoWfp1QD3Y9nZoqfbpuFOXCxKm5lbyFsmqFErl7vMAygUdnCnsIvEJbRRqjc
         YaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699259167; x=1699863967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUKa+dq+yboEToV9c6wS680Ux5CIHHimAdjadaUPKj4=;
        b=qoI8l04BDEmruLoX6wTFBNZRTR+BuC3sQpWHBnEvX2r792PjqV2XB57X0MuNpnYgIp
         NZn5TclpD6xG8Q5ck4xg1AIJBOfPd2skan20r/l9t8ceq/5DeRJXdQNzmbfvYQT5ZgWT
         sFFXqrE9OXhAOyA6cSjDPA4xq2k+kq/Ool8R2mXNA7x+LxTiQornbqt9e6D4AFudO8i8
         vCEg0HZpBI2x9EHRb+ItQnXh6kY+GR/A7RCTkBswSGybv31ZKfZqTNUBaYuulJPzxBpr
         aECpesLI4lybGmlExy+n2kvdUI90hBGKTJ7HaJws8+T5gV8RWbdwHpgq5fT3HPspWnmx
         Riqw==
X-Gm-Message-State: AOJu0Yy9AUbxKuvkRn9+PR11DhVV18WHXC8QUIBGWBZ7+TdzAb+Cd6GS
        hdS74TirUY59p3SKZnOCxkEEzg==
X-Google-Smtp-Source: AGHT+IELj8Ab9EVfhzSfFW30uYK7/Bd+5RUxWTV6FjKDoXv0uz2zC5dNlKjeFrruBoz7DUdUu5OF0A==
X-Received: by 2002:a05:600c:4687:b0:409:5a92:470c with SMTP id p7-20020a05600c468700b004095a92470cmr12523024wmo.13.1699259167613;
        Mon, 06 Nov 2023 00:26:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id az25-20020a05600c601900b004095874f6d3sm11610663wmb.28.2023.11.06.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:26:07 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 06 Nov 2023 09:25:58 +0100
Subject: [PATCH v3 05/11] dt-bindings: clock: qcom-rpmhcc: document the
 SM8650 RPMH Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-topic-sm8650-upstream-clocks-v3-5-761a6fadb4c0@linaro.org>
References: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
In-Reply-To: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3OGk8WniY/E80D7AnGFZsLrGftq5gP+nMB6OXCYdMrI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlSKMW7lm9NdzgN0/vkgPrze6K2icFamojsAIHrYw+
 1qLo/v2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUijFgAKCRB33NvayMhJ0SvvD/
 0RZdvC0Yehcg8shp+KAo9SgSQ6OEzY4kO51PG3CYynKctejqTKshv5pagV8KbM7Q7bhAZW1n0IsmrF
 4Jy4uhaGjaKqsHyavByOzJJEhkUsMQHoCl9j4dJYrWxyEPTdmkocd99Bk59NkZK4vwkW1/snCvbPsx
 xuRAqYXcWWbHpeKkawJdb+jTIY/c3bQDytc8jpoCMgRhm9Extq4IavgodNZYFKTjVuRIvOEJZt18Df
 oasT/Qp5nStlz8KJBkBOlLiwie6T/fuvhLwfP/tvuEuQ9kvT4crInbGM7G/evMXzlOom+RHQU89R3E
 928dSXp9wUTtw6sLN8oKYXeODwtAJjJ5NMVQ07yGhaxoMXNL6EPVM71vf3XrsSPYKMph7oDOwS2kv1
 J7lVQ8udH6UjF/24B2J/C80SMn+WuC5iKeIeJBtMZ7yNmLghJgorz9uL+DYnN4ixy116B3RoTRI4di
 KvjW+RV16WDHdfgeZFdsNlq2rQRNBVAUz/KFExpoXLRcezXx9Wpw1KfgadvnuVRMPuVL64wDdBZI2C
 9ocf0tdiKskDdSCPBiTxeMBFsAM8+PZWy0Zxu0pnAFxHo3KSezZ3QEvd7Gc9BdxOEQYp1IBNRGE/CU
 NRiVMbGfvTMiBkfhu0RU3Wbztlsz9o/ghw/PrIhRnIYALPeq8hVKRI3I9VDg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for the SM8650 RPMH Clock Controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 4eb5e59f6772..9be952a5a227 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
       - qcom,sm8550-rpmh-clk
+      - qcom,sm8650-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

