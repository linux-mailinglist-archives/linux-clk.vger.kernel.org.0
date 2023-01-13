Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DB1668896
	for <lists+linux-clk@lfdr.de>; Fri, 13 Jan 2023 01:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239204AbjAMAg3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 Jan 2023 19:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234765AbjAMAgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 19:36:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931BD6133A;
        Thu, 12 Jan 2023 16:36:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2118B8203E;
        Fri, 13 Jan 2023 00:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BBCC433EF;
        Fri, 13 Jan 2023 00:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673570168;
        bh=aRG0HqCnMaQxo0ef4kIoeT8KHMrF7fFixGKcmhALUUQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E/xs7eefPpg+eduQl8Ta0vx/8uvc6YQIw4PZw+m+VYunc2Wwv3ZR01u7Q8NcKWEvr
         WXGzyMCHNKmg1mYV2k2oHEPjK+6HuFSVrFKhKHs0uEmr5Cz6upnvPCtXkD/YNbt9R2
         nkMw4OW99pznHodGoBDNLHWsRLvOY+FvyqNrbtlG4ZiCtcQUnHsWeP2l6jw7pLV58u
         jveDwtnxwIhWOBfFzhI4o3QMcfcoxGLZvudMCILFpQoFkvJbjiN/VfW+RVy4I9MDcK
         Rf09eQvn+wAptRVEYRYolj+Qf6bm1RHges5j9xCAdX8BKGy90lF/rKVV8HUUuJM3dN
         K6ULa3P7SAjeQ==
Message-ID: <5fd524b02f3b9c8f53ce026a0c3cb89f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221228185237.3111988-16-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org> <20221228185237.3111988-16-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 15/16] clk: qcom: mmcc-msm8998: get rid of test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Thu, 12 Jan 2023 16:36:06 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-28 10:52:36)
> The test clock apparently it's not used by anyone upstream. Remove it.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
