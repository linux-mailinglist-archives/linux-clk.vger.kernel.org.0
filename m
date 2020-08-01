Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3AB2353F9
	for <lists+linux-clk@lfdr.de>; Sat,  1 Aug 2020 20:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgHASNw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 1 Aug 2020 14:13:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29820 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgHASNv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 1 Aug 2020 14:13:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596305630; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cJyeRZPN9m3WfcT3UaEZE4Gf1yPYYNx/SsDF1xhJnSc=; b=J2rLvbM1AS4nPsQY2mKc7QTic2BBEvqHh32abwiggWJRx9KgjrEM5qemEQUZJ4dPd4KBNDJ3
 7QSuNEPJ66p9dodI5COWDQSUiJfX8MBVxZYANwJVVvv/BbSlARE7g5MScSl/740TCcLnv+uN
 GyhkANjuB/tjz6U+QDD4iYrrjDM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f25b0debcdc2fe47193e77e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 Aug 2020 18:13:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DEC6BC43391; Sat,  1 Aug 2020 18:13:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C85ECC433C6;
        Sat,  1 Aug 2020 18:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C85ECC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2] Add LPASS clock controller Node for SC7180
Date:   Sat,  1 Aug 2020 23:43:34 +0530
Message-Id: <1596305615-5894-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[v2]
 - Update the node in sorted order.
 - Depends on the patch
  https://lore.kernel.org/r/20200731133006.1.Iee81b115f5be50d6d69500fe1bda11bba6e16143@changeid

[v1]
 - Clock controller LPASS device Node.

Taniya Das (1):
  arm64: dts: qcom: sc7180: Add LPASS clock controller nodes

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

