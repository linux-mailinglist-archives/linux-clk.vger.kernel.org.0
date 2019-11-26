Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27AD4109799
	for <lists+linux-clk@lfdr.de>; Tue, 26 Nov 2019 02:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKZBlZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Nov 2019 20:41:25 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:32962 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfKZBlZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Nov 2019 20:41:25 -0500
Received: by mail-ot1-f66.google.com with SMTP id q23so8657219otn.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2019 17:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rJcDUhXRDoSzU6VM3BwzPwwJv9tkg4wejkptoQyWbDs=;
        b=PLa0RvD/Cw1dZHdlKEMV5+pqmN7gTd7mJ7kFctBiA9BgAdIasobDba62BcJID3HI3g
         vgDACsfyZEuksaXJuc/c0jwm7eFhn4gYDE1xFXjmO8RZRHmaUCqBTucA4b6aPEdH7R3g
         Qyup2OUTGXIXqUMRoKvC/Hd/Nlu4UcDJcyRCR15X0tZkmq2Lds64U6MdEfSZOnhIvOYc
         7PLZkYY8tzcFRZVbL+Ew2Nru4YDGl0NIcXcdq9KxhKDq25dJoqDocsumJzcAGTJWnZI6
         ncPv8Xcn7vQsO8v9g5lfOEAAJStwOD5O0gB2Urf5xkRqP+jF9MwQ7rDTKnQ0cHWvxOLj
         ectA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rJcDUhXRDoSzU6VM3BwzPwwJv9tkg4wejkptoQyWbDs=;
        b=hFLBnF08T4sWFJISfaOEvGFzZnOYmXiq6VyY9VWU3vVe6J2CKDXs1LCIRjxW9caFUV
         XeUjw2tDv+RJGTVbOpzfdknLTY9NF3uduvCdgciUwNNupMp9LrgkP3Yuv8G0EliiYNMf
         hRV4+gP+gMITEAeeZ0VP2iAksYxmzzqkozGUIgt7OIjGUN+FZ7IhJlztCP+4dvOTG0IO
         sFs7XhH5FGvG29AjxSNv1c0PRPO2nvyL2OUwF/vTfpyLtT8/FuUbwrlbt5kg6c9ZiyBy
         Hm6f+Uz21JouAONX4Y+Pe9m9Nol0KLWWP3VVFcJ7GXwgPRtYWBcp2KQzLDFroz7UcMIi
         G1/g==
X-Gm-Message-State: APjAAAXaRLzzfNH1URp1oXzRoezA4PAwjaG/3NjYPxuiftS65k7D7xcH
        m+uN/gDZA8TJOYoPBLlYudXeBHvSwtBkFtv2iQ/QKg==
X-Google-Smtp-Source: APXvYqw0BmovICQjw2LolyXyVvHcUdAWM4lQJR2O96N2H6/dRSdg9xnFk8UVk+dPxzT2YkdZqfMBqN+lKzCDAkmJsHo=
X-Received: by 2002:a9d:648f:: with SMTP id g15mr536456otl.195.1574732483510;
 Mon, 25 Nov 2019 17:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20191118234229.54085-1-saravanak@google.com>
In-Reply-To: <20191118234229.54085-1-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 25 Nov 2019 17:40:46 -0800
Message-ID: <CAGETcx-CX7aR66XAvZbD9MLeLgtbPPHaFaAOY5f-OqOcWLGndw@mail.gmail.com>
Subject: Re: [PATCH v1] clk: Keep boot clocks on for multiple consumers
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Android Kernel Team <kernel-team@android.com>,
        linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 18, 2019 at 3:42 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Clocks can turned on (by the hardware, bootloader, etc) upon a
> reset/boot of a hardware platform. These "boot clocks" could be clocking
> devices that are active before the kernel starts running. For example,
> clocks needed for the interconnects, UART console, display, CPUs, DDR,
> etc.
>
> When a boot clock is used by more than one consumer or multiple boot
> clocks share a parent clock, the boot clock (or the common parent) can
> be turned off when the first consumer probes. This can potentially crash
> the device or cause poor user experience.
>
> This patch fixes this by explicitly enabling the boot clocks during
> clock registration and then disabling them at late_initcall_sync(). This
> gives all the consumers until late_initcall() to put their "votes" in to
> keep any of the boot clocks on past late_initcall().
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/clk/clk.c            | 62 ++++++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h |  1 +
>  2 files changed, 63 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1c677d7f7f53..a1b09c9f8845 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -72,6 +72,8 @@ struct clk_core {
>         unsigned long           flags;
>         bool                    orphan;
>         bool                    rpm_enabled;
> +       bool                    state_held;
> +       bool                    boot_enabled;
>         unsigned int            enable_count;
>         unsigned int            prepare_count;
>         unsigned int            protect_count;
> @@ -1300,6 +1302,36 @@ static int clk_disable_unused(void)
>  }
>  late_initcall_sync(clk_disable_unused);
>
> +static void clk_unprepare_disable_subtree(struct clk_core *core)
> +{
> +       struct clk_core *child;
> +
> +       lockdep_assert_held(&prepare_lock);
> +
> +       hlist_for_each_entry(child, &core->children, child_node)
> +               clk_unprepare_disable_subtree(child);
> +
> +       if (!core->state_held)
> +               return;
> +
> +       clk_core_disable_unprepare(core);
> +}
> +
> +static int clk_release_boot_state(void)
> +{
> +       struct clk_core *core;
> +
> +       clk_prepare_lock();
> +
> +       hlist_for_each_entry(core, &clk_root_list, child_node)
> +               clk_unprepare_disable_subtree(core);
> +
> +       clk_prepare_unlock();
> +
> +       return 0;
> +}
> +late_initcall_sync(clk_release_boot_state);
> +
>  static int clk_core_determine_round_nolock(struct clk_core *core,
>                                            struct clk_rate_request *req)
>  {
> @@ -1674,6 +1706,30 @@ static int clk_fetch_parent_index(struct clk_core *core,
>         return i;
>  }
>
> +static void clk_core_hold_state(struct clk_core *core)
> +{
> +       if (core->state_held || !core->boot_enabled ||
> +           core->flags & CLK_DONT_HOLD_STATE)
> +               return;
> +
> +       WARN(core->orphan, "%s: Can't hold state for orphan clk\n", core->name);
> +
> +       core->state_held = !clk_core_prepare_enable(core);
> +}
> +
> +static void __clk_core_update_orphan_hold_state(struct clk_core *core)
> +{
> +       struct clk_core *child;
> +
> +       if (core->orphan)
> +               return;
> +
> +       clk_core_hold_state(core);
> +
> +       hlist_for_each_entry(child, &core->children, child_node)
> +               __clk_core_update_orphan_hold_state(child);
> +}
> +
>  /*
>   * Update the orphan status of @core and all its children.
>   */
> @@ -3374,6 +3430,8 @@ static int __clk_core_init(struct clk_core *core)
>                 rate = 0;
>         core->rate = core->req_rate = rate;
>
> +       core->boot_enabled = clk_core_is_enabled(core);
> +
>         /*
>          * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
>          * don't get accidentally disabled when walking the orphan tree and
> @@ -3389,6 +3447,9 @@ static int __clk_core_init(struct clk_core *core)
>                 clk_enable_unlock(flags);
>         }
>
> +       if (!core->orphan)
> +               clk_core_hold_state(core);
> +
>         /*
>          * walk the list of orphan clocks and reparent any that newly finds a
>          * parent.
> @@ -3408,6 +3469,7 @@ static int __clk_core_init(struct clk_core *core)
>                         __clk_set_parent_after(orphan, parent, NULL);
>                         __clk_recalc_accuracies(orphan);
>                         __clk_recalc_rates(orphan, 0);
> +                       __clk_core_update_orphan_hold_state(orphan);
>                 }
>         }
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 2fdfe8061363..f0e522ea793f 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,7 @@
>  #define CLK_OPS_PARENT_ENABLE  BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT  BIT(13)
> +#define CLK_DONT_HOLD_STATE    BIT(14) /* Don't hold state */
>
>  struct clk;
>  struct clk_hw;
> --
> 2.24.0.432.g9d3f5f5b63-goog
>

Stephen,

Nudge, nudge. Thoughts?

-Saravana
