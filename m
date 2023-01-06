Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2940E65FC09
	for <lists+linux-clk@lfdr.de>; Fri,  6 Jan 2023 08:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjAFHdg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Jan 2023 02:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbjAFHdS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 02:33:18 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568576ADBA
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 23:33:16 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bu8so936936lfb.4
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvEio1+igdk3BKLM5KwSSynNukEGELLp+8lBoQco51w=;
        b=pJbr+K2AWSSMaminushp6rGTkoXBXInQuyWhTREUiCca0ycmNr/zT1savQv5a4n5Vs
         QfNWgbRpUuQy8QSlKr12U0RBBsGBhPu2VKsKDW4vtLP/fOvQ55vE5x/7yD0pGPaPWmKO
         5odvT21Xlsz2tydmFoatjWiihhnxZxj3PfL3DJzJcnn6Z2rGx/ZpI67Abhr3jX5Bsx7K
         15hJOiI9H5fMkPLYiMZ4g5ymRkhCSbro5HhdY+WJSzkOeUgtDQPG/8YfADYnJwbypVNR
         B/2oKtoytHuNX+aIFVO7mTWNsy/ZM/EoVPLTRXB2lqQyNsgKsoJwnsOu38DFnLES65zU
         OtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvEio1+igdk3BKLM5KwSSynNukEGELLp+8lBoQco51w=;
        b=Kzw4f9bXFz4UnIJ5uIVvVM41U42k5A5H0HGxC4IA8Qv/VdHxyaxjMYE46x672/o5iQ
         Al1JALnmQyOmobp4zFtm08wvehsIi6tTEEcmeUfn1IBf2XSksSkXF3V4YozlHkqRJ2XW
         mfL8Ega8F/isOx2wpYvWevAXVShX3gpFT77X3jBb2pqQ56+h++nCAQRc9I1Qf/F1IHsc
         FIR7GHWiTwrlPAEMbNSFgAJivAzU1SdpJYOYkla+uOvK8d7xXkeOSSJHgTVjx4Wy1qCd
         gSPf9Mm638rTEhtuAdCzvpr04gT8E7fSJ9cb3jV7eI1ADJMB3vrqDcmfHArIHN+s/9D/
         CBJQ==
X-Gm-Message-State: AFqh2kq+HGzBiDgMJrF+9mFvtz+Rdx8dCutucT4WNRZaHdRVQRnW6EzQ
        ikhLFdrhvfgmMbjdNXTaaCa98DXdZ8zIQQ0E
X-Google-Smtp-Source: AMrXdXvgKCAsAEmTM7x6a3J2dJ8Nq5gml79wA5CV7Ao70xYDgfzyOojrtzSJ2wkORtRZx9eQ3tlFGg==
X-Received: by 2002:ac2:5ec9:0:b0:4b5:b6e8:bb53 with SMTP id d9-20020ac25ec9000000b004b5b6e8bb53mr14240275lfq.24.1672990394713;
        Thu, 05 Jan 2023 23:33:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c28-20020ac25f7c000000b004b4bb6286d8sm61114lfc.84.2023.01.05.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:33:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/9] clk/interconnect: qcom: finish migration of IP0 to clocks
Date:   Fri,  6 Jan 2023 09:33:04 +0200
Message-Id: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commits 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0
interconnects") and 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0
interconnects") removed IP0 interconnects (and ipa-virt devices support)
in favour of the RPMH clocks. Follow this example for other platforms
defining IP0 RPMH resource. While we are at it, remove several leftover
from the mentioned patches.

Dmitry Baryshkov (9):
  clk: qcom: rpmh: define IPA clocks where required
  interconnect: qcom: sdx55: drop IP0 remnants
  interconnect: qcom: sc7180: drop IP0 remnants
  interconnect: qcom: sm8150: Drop IP0 interconnects
  interconnect: qcom: sm8250: Drop IP0 interconnects
  interconnect: qcom: sc8180x: Drop IP0 interconnects
  interconnect: qcom: sc8280xp: Drop IP0 interconnects
  dt-bindings: interconnect: qcom: Remove sc7180/sdx55 ipa compatibles
  dt-bindings: interconnect: qcom: drop IPA_CORE related defines

 .../bindings/interconnect/qcom,rpmh.yaml      |  3 --
 drivers/clk/qcom/clk-rpmh.c                   |  4 ++
 drivers/interconnect/qcom/sc7180.h            |  2 -
 drivers/interconnect/qcom/sc8180x.c           | 38 -------------------
 drivers/interconnect/qcom/sc8180x.h           |  2 -
 drivers/interconnect/qcom/sc8280xp.c          | 25 ------------
 drivers/interconnect/qcom/sc8280xp.h          |  2 -
 drivers/interconnect/qcom/sdx55.h             |  2 -
 drivers/interconnect/qcom/sm8150.c            | 21 ----------
 drivers/interconnect/qcom/sm8150.h            |  2 -
 drivers/interconnect/qcom/sm8250.c            | 21 ----------
 drivers/interconnect/qcom/sm8250.h            |  2 -
 .../dt-bindings/interconnect/qcom,sc7180.h    |  3 --
 .../dt-bindings/interconnect/qcom,sc8180x.h   |  3 --
 .../dt-bindings/interconnect/qcom,sc8280xp.h  |  2 -
 include/dt-bindings/interconnect/qcom,sdx55.h |  2 -
 .../dt-bindings/interconnect/qcom,sm8150.h    |  3 --
 .../dt-bindings/interconnect/qcom,sm8250.h    |  3 --
 18 files changed, 4 insertions(+), 136 deletions(-)

-- 
2.39.0

