Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A05973419A
	for <lists+linux-clk@lfdr.de>; Sat, 17 Jun 2023 16:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346228AbjFQOP5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 17 Jun 2023 10:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjFQOP4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 10:15:56 -0400
Received: from mail-yw1-x1141.google.com (mail-yw1-x1141.google.com [IPv6:2607:f8b0:4864:20::1141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41C61BD1
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 07:15:55 -0700 (PDT)
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-57001c0baddso19338117b3.2
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687011355; x=1689603355;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK8CSnpK/Lj4WgPXCAFjMD2+8ZPe0cG8Mxg2WoY+zJk=;
        b=iCjO1RaL5DUtjSHnjy9rZ1eDZEE8GOT0zEeBjTIPnxUDhma+mPuDXgi5VvqDMyfFM9
         jwvZPx6fS6S4jp2FUu2xVv1KEBr+q6aABixysdYvQEKGZ2W2GFQiYf+tAnZBZbP7eez+
         cbPyKFU+l4CwiLFcHoWDE15c16F0nwKnwQTeBv6woL0cnu+t/tq2jgtZlnR5md9KNvrv
         qhYdzxK8nWyrJAelcCWpUR2B0Z8x1u5UMELhcqCksb30Mo2iUXo1FfbyO1QGDAyvxnMe
         Few5PkY5xdtF8YYMpNWHGmxoatjkelVmHuW280yHGoFFEz12dyKpcIlS/hwk0HHEUstd
         UD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687011355; x=1689603355;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PK8CSnpK/Lj4WgPXCAFjMD2+8ZPe0cG8Mxg2WoY+zJk=;
        b=gwJS04mcGnhiHMjC/gMZ/QtBRNgeabdgsAF9QAJre3Sy1YGUAimbc+1DAjT+Qf82Hq
         3RWVasuK6wF6phXZvy1j36F94JXPeJPskpBY8sbzdlJdkA9TtfIVjFZY/xA4ws0zEXP3
         RnzZzcpN/MGhIiIUEZI0ye+CL0NUP4AoIhDGESs6n0mj83Jj7dV5yX3o/6F8kE0AllRK
         InWe6o+7YOKg/SXYACkj7+Y57RcRvNLEimPfG6qBNs3iClaDvEvFOcguzllfmk7B/je/
         426X5Z0lU/1SkdQNfAk9cLqwrzw6FGWHRJ3Z+Gr8Th5X41UJ2PegqO5n9hgB98jYP/ij
         z0Rg==
X-Gm-Message-State: AC+VfDyfPF1V5U+98H4qDXHTIxJKx768HYU6B7yoEHoQ7Is6+rO9RWRX
        RTIwEcEJDBhjYV1c8EW5cbjgVAPWeqzzrsXnMyI=
X-Google-Smtp-Source: ACHHUZ6K9/FpnnOiVsTNcgneVBQee2XoPPTd8J+XO2tWD4fuXHFh3uzGs5rKFqjd+TYjpllBa8AopIyiQZfpLsfP6Qs=
X-Received: by 2002:a81:8409:0:b0:56f:ff55:2b74 with SMTP id
 u9-20020a818409000000b0056fff552b74mr4936444ywf.37.1687011354754; Sat, 17 Jun
 2023 07:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:5206:b0:310:6f5c:ec65 with HTTP; Sat, 17 Jun 2023
 07:15:54 -0700 (PDT)
Reply-To: infoconsul03@gmail.com
From:   David Mensah <alannahnessa241@gmail.com>
Date:   Sat, 17 Jun 2023 07:15:54 -0700
Message-ID: <CAJX7a8b=6QgKxm_SYz8bfLWRp19hd9if3xS+sSA68MqV6QNHZA@mail.gmail.com>
Subject: PRS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

-- 
Hello my friend, did you receive my mail?
