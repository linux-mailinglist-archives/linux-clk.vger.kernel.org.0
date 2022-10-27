Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5ED361052E
	for <lists+linux-clk@lfdr.de>; Fri, 28 Oct 2022 00:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbiJ0WAN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Oct 2022 18:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbiJ0WAL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 18:00:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C1027FF0;
        Thu, 27 Oct 2022 15:00:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2446862552;
        Thu, 27 Oct 2022 22:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A20C43470;
        Thu, 27 Oct 2022 22:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666908009;
        bh=WqcSx82M/KeDSCKd8hBkqnAYkWFHHlDI8C8zRzExk/I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NLCLOdUn9WEzgRdXV+QwBajXm+eoKAxuzT5M5sNWy/1iYufktc0YuMuPUgSql/J8G
         5Hiv5NQUZHXZfh6R161HmXf8nRZfse6pwhU0Ma7xDDOJTqENyZjAwwPNXK1n7SYj91
         c9+SrR6GATsZLtlzaKcUIGi90N9TVIDMSOIWTthvYuV6+VcG5B1Xg2cM+cm2v/07eO
         Fqfd4xFec9/nqnrgJU8tPtppLY/I+7qqmSuSbfowRoxftHJR7Yum/K109od1SceKgf
         W4Tg/772R8YtX6NqAqDiC1yno9KQf5xjnZLW3udW1+nFP2ejoVMwqJnAfY8FNFh5Xs
         ys5otUADyRlRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221021064757.379558-1-alexander.stein@ew.tq-group.com>
References: <20221021064757.379558-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: clock: ti,cdce925: Convert to DT schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 27 Oct 2022 15:00:07 -0700
User-Agent: alot/0.10
Message-Id: <20221027220009.66A20C43470@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Stein (2022-10-20 23:47:57)
> Convert the TI CDCE925 clock binding to DT schema format.
> Including a small fix: Add the missing 'ti' prefix in the example
> compatible.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied to clk-next
