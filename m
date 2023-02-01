Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB15467BEE3
	for <lists+linux-clk@lfdr.de>; Wed, 25 Jan 2023 22:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbjAYVot (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Jan 2023 16:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235962AbjAYVop (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 16:44:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DED1BE5;
        Wed, 25 Jan 2023 13:44:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E76EE61698;
        Wed, 25 Jan 2023 21:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B29CC433D2;
        Wed, 25 Jan 2023 21:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683083;
        bh=Ck9ecZXa0zdStDQE5XnRRF0tlSEjaxB8JQ8E8PTiL6I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cqrlHEE1NhGE1bdXZ0TGmBPbSJBffG8sJMQmFJvA6Wk9jTEFh2JfhmsZuV2QCkOl9
         8D0FP8Jeda7ECVev8GOhURBjMK4bn2/9xO2r8UjINHieB+Ostx3Wr0P9RnrslGyn5D
         OvsKEE3blu21eEtgGXX3QgcP6B7GPWhbXFaWtLQZffu8Qbni/FpxNysPt9hjxn3jSI
         JGxWePqZ3jpxTioka0P89ickZkJxM60QWFqqrr7c4kOypWOmOHd+5aNP7ykFBqLe6l
         44J4+uM5/8F4F/153SB48AnRAnQA9TMwrj7/SNlSGjMbBW/9hruey0VxSjp4bt9AUv
         /0u8SdUj5uiIQ==
Message-ID: <b090c179a5febcbdd15b1a437b1a4a4a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-3-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:44:41 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:52)
> Add GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for the
> multimedia subsystem.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
